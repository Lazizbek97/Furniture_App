import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:furniture_app/screens/providers/auth_provider/auth_provider.dart';
import 'package:furniture_app/screens/providers/change_profile_pic/change_profile_pic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/hive/hive_boxes.dart';
import '../../../core/utils/constants.dart';
import '../search_page/search_page.dart';
import 'components/account_page_menu.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = context.watch<AuthProvider>().fireBaseAuth.currentUser;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            await showSearch(
              context: context,
              delegate: SearchPage(),
              query: "search...",
            );
          },
          icon: SvgPicture.asset(
            Constants.searchImage,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // await Boxes.getFavorites().clear();
              await Boxes.getCartItems().clear();
              Navigator.pushReplacementNamed(context, "/");
              await context.read<AuthProvider>().signOut();
            },
            icon: SvgPicture.asset(
              "assets/images/logout.svg",
            ),
          ),
        ],
      ),
      
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: getHeight(40),
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/images/loading.gif"),
                      child: Container(
                        height: getHeight(90),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                context
                                    .watch<ChangeProfilePicture>()
                                    .profilePicLink
                                    .toString(),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                    Positioned(
                      bottom: -5,
                      right: -8,
                      child: IconButton(
                          onPressed: () async {
                            await context
                                .read<ChangeProfilePicture>()
                                .uploadPicture();
                          },
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  width: getWidth(20),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user == null
                          ? "No Account name"
                          : user.displayName.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user == null ? "No email" : user.email.toString(),
                      style: TextStyle(
                        color: Constants.color80,
                      ),
                    ),
                  ],
                )
              ],
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, "/myorders"),
              child: const AccoutPageMenus(
                title: "My orders",
                subtitle: "You have 10 orders",
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, "/shipping_address"),
              child: const AccoutPageMenus(
                title: "Shipping Address",
                subtitle: "3 Addresses",
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, "/payment_methods"),
              child: const AccoutPageMenus(
                title: "Payment Method",
                subtitle: "You have 2 cards",
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, "/my_reviews"),
              child: const AccoutPageMenus(
                title: "My reviews",
                subtitle: "Reviews for 5 items",
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, "/settings_page"),
              child: const AccoutPageMenus(
                title: "Settings",
                subtitle: "Notification, Password, FAQ, Contact",
              ),
            ),
             InkWell(
              onTap: () => Navigator.pushNamed(context, "/about_me"),
              child: const AccoutPageMenus(
                title: "About me",
                subtitle: "Information about Developer",
              ),
            ),
            SizedBox(
              height: getHeight(50),
            ),
          ],
        ),
      ),
    );
  }
}
