import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/size_config.dart';

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
          onPressed: () {},
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
      body: ListView.separated(
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
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    horizontalTitleGap: 5,
                    leading: Container(
                      height: getHeight(70),
                      width: getHeight(70),
                      margin: EdgeInsets.only(right: getWidth(20)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/minimalstand.png"),
                        ),
                      ),
                    ),
                    title: const Text(
                      "Your order #123456789 has been confirmed",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis pretium et in arcu adipiscing nec. Turpis pretium et in arcu adipiscing nec. ",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                  Positioned(
                    bottom: getHeight(2),
                    left: getWidth(324),
                    child: Text(
                      _isSelected ? "NEW" : "",
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
          separatorBuilder: (c, i) => Divider(
                color: Constants.dividerColor,
              ),
          itemCount: 10),
    );
  }
}
