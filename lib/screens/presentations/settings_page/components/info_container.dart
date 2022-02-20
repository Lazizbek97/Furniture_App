import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/size_config.dart';

class InfoContainer extends StatelessWidget {
  InfoContainer({
    Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);

  String title;
  String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(64),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Color(0xff9B9B9B), fontSize: 12),
          ),
          Text(
            info,
            style: TextStyle(fontWeight: Constants.semiBold),
          ),
        ],
      ),
    );
  }
}
