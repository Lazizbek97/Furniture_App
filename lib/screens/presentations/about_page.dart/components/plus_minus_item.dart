import 'package:flutter/material.dart';

import '../../../../core/utils/size_config.dart';

class PlusMinusItem extends StatelessWidget {
  const PlusMinusItem({Key? key, required this.icon}) : super(key: key);

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(30),
      width: getWidth(30),
      decoration: BoxDecoration(
          color: const Color(0xffE0E0E0),
          borderRadius: BorderRadius.circular(10)),
      child: icon,
    );
  }
}