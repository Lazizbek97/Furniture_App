import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:furniture_app/screens/providers/auth_provider/auth_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import 'components/account_page_menu.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = context.watch<AuthProvider>().fireBaseAuth.currentUser;
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
          "Profile",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthProvider>().signOut();
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
                CircleAvatar(
                  radius: getHeight(40),
                  backgroundImage:
                      const AssetImage("assets/images/profile_pic.png"),
                ),
                SizedBox(
                  width: getWidth(20),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user!.displayName.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "ibnshomurod@mail.ru",
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
            SizedBox(
              height: getHeight(61),
            ),
          ],
        ),
      ),
    );
  }
}
