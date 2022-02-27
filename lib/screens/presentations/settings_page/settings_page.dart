import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:furniture_app/screens/presentations/settings_page/components/edit_name_email.dart';
import 'package:furniture_app/screens/providers/notifications_provider/notification_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import '../../providers/auth_provider/auth_provider.dart';
import 'components/info_container.dart';
import 'components/notifications_container.dart';
import 'components/settings_info_titles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = context.watch<AuthProvider>().fireBaseAuth.currentUser;
    var notification = context.watch<NotificationProvider>();

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
      body: SingleChildScrollView(
        child: Container(
          height: getHeight(717),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SettingInfoTitle(
                title: "Personal Information",
                editFunc: () {
                  showDialog(
                    context: context,
                    builder: (context) => EditNameEmail(
                      name: user!.displayName.toString(),
                      email: user.email.toString(),
                    ),
                  );
                },
              ),
              InfoContainer(
                title: "Name",
                info: user!.displayName.toString(),
              ),
              InfoContainer(
                title: "Email",
                info: user.email.toString(),
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
                switcher: CupertinoSwitch(
                    value: notification.sales,
                    onChanged: (v) {
                      context.read<NotificationProvider>().changeSales();
                    }),
              ),
              NotificationsContainer(
                title: "New arrivals",
                switcher: CupertinoSwitch(
                    value: notification.new_arrivals,
                    onChanged: (v) {
                      context.read<NotificationProvider>().changeNewArrivals();
                    }),
              ),
              NotificationsContainer(
                title: "Delivery status changes",
                switcher: CupertinoSwitch(
                    value: notification.delivery_status,
                    onChanged: (v) {
                      context
                          .read<NotificationProvider>()
                          .cahngeDeliveryStatus();
                    }),
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
      ),
    );
  }
}
