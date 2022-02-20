import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/constants.dart';

class SettingInfoTitle extends StatelessWidget {
  const SettingInfoTitle({
    Key? key,
    required this.title,
    required this.editFunc,
  }) : super(key: key);

  final String title;
  final editFunc;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16,
              fontWeight: Constants.semiBold,
              color: Constants.color90),
        ),
        IconButton(
          onPressed: editFunc,
          icon: SvgPicture.asset("assets/images/edit.svg"),
        ),
      ],
    );
  }
}
