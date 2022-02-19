import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/size_config.dart';
import 'package:furniture_app/core/utils/constants.dart';

class MenuButtons extends StatelessWidget {
  const MenuButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: getHeight(44),
            width: getWidth(44),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SvgPicture.asset(Constants.bedImage),
          ),
          Text(
            "Chair",
            style: TextStyle(
              color: Constants.color80,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
