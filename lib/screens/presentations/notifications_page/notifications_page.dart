import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/models/user_model.dart';
import '../../../core/utils/constants.dart';
import '../../../core/utils/size_config.dart';
import '../../providers/auth_provider/auth_provider.dart';
import '../search_page/search_page.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late bool _isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              // await showSearch(
              //   context: context,
              //   delegate: SearchPage(),
              // );
            },
            icon: SvgPicture.asset(
              Constants.searchImage,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Notification",
            style: GoogleFonts.merriweather(
              fontWeight: Constants.bold,
              fontSize: 16,
            ),
          ),
        ),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(AuthProvider(FirebaseAuth.instance)
                    .fireBaseAuth
                    .currentUser!
                    .email)
                .snapshots(includeMetadataChanges: true),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snap) {
              if (snap.hasError) {
                return const Center(
                  child: Text("Somthing went wrong"),
                );
              } else if (snap.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text("Loading..."),
                );
              }
              List<NotificationModel> notifications =
                  (snap.data!.data()!['notifications'] as List)
                      .map((e) => NotificationModel.fromJson(e))
                      .toList();

              return notifications.isEmpty
                  ? const Center(
                      child: Text("There is no any Notifications yet"),
                    )
                  : ListView.separated(
                      itemBuilder: (__, _) => Stack(
                            children: [
                              ListTile(
                                minLeadingWidth: 100,
                                isThreeLine: true,
                                minVerticalPadding: 0,
                                selectedTileColor: const Color(0xffF0F0F0),
                                selectedColor: Colors.black,
                                selected: _isSelected,
                                onTap: () {
                                  _isSelected = !_isSelected;

                                  setState(() {});
                                },
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 0),
                                horizontalTitleGap: 5,
                                leading: Container(
                                  height: getHeight(70),
                                  width: getHeight(70),
                                  margin: EdgeInsets.only(right: getWidth(20)),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/notification.gif"),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  notifications[_].title.toString(),
                                  // "Your order #12345678 has been confirmed"
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  notifications[_].disc.toString(),
                                  // "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec. ",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                              Positioned(
                                bottom: getHeight(2),
                                left: getWidth(324),
                                child: Text(
                                  _isSelected ? "NEW" : "",
                                  style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          ),
                      separatorBuilder: (c, i) => Divider(
                            color: Constants.dividerColor,
                          ),
                      itemCount: 2);
            }));
  }
}
