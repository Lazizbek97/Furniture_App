import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';

class NotificationsContainer extends StatelessWidget {
  NotificationsContainer({
    Key? key,
    required this.title,
    required this.switcher,
  }) : super(key: key);

  String title;
  Widget switcher;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(54),
      width: getWidth(335),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          switcher,
        ],
      ),
    );
  }
}
