import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/size_config.dart';

class BagButton extends StatelessWidget {
  const BagButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(30),
      width: getHeight(30),
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        color: const Color(0xffBBBBBB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SvgPicture.asset(
        "assets/images/bag.svg",
        color: Colors.white,
      ),
    );
  }
}
