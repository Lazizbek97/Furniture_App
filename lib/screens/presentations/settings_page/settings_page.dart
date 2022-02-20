import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/constants.dart';
import 'components/info_container.dart';
import 'components/notifications_container.dart';
import 'components/settings_info_titles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Settings",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Container(
        height: getHeight(717),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SettingInfoTitle(
              title: "Personal Information",
              editFunc: () {},
            ),
            InfoContainer(
              title: "Name",
              info: "Lazizbek Fayziev",
            ),
            InfoContainer(
              title: "Email",
              info: "ibnshomurod@mail.ru",
            ),
            SettingInfoTitle(
              title: "Password",
              editFunc: () {},
            ),
            InfoContainer(
              title: "Your password",
              info: "***********",
            ),
            Text(
              "Notifications",
              style: TextStyle(
                fontSize: 16,
                fontWeight: Constants.semiBold,
                color: Constants.color90,
              ),
            ),
            NotificationsContainer(
              title: "Sales",
              switcher: CupertinoSwitch(value: true, onChanged: (v) {}),
            ),
            NotificationsContainer(
              title: "New arrivals",
              switcher: CupertinoSwitch(value: false, onChanged: (v) {}),
            ),
            NotificationsContainer(
              title: "Delivery status changes",
              switcher: CupertinoSwitch(value: true, onChanged: (v) {}),
            ),
            Text(
              "Help Center",
              style: TextStyle(
                fontSize: 16,
                fontWeight: Constants.semiBold,
                color: Constants.color90,
              ),
            ),
            InkWell(
              onTap: () {},
              child: NotificationsContainer(
                title: "FAQ",
                switcher: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
