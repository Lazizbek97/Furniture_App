import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/models/furniture_model.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/size_config.dart';

class RatingsPart extends StatelessWidget {
  const RatingsPart({
    Key? key,
    required this.mebels,
    required this.index,
  }) : super(key: key);

  final Item mebels;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("assets/images/ystar.svg"),
        Text(
          "  ${mebels.ratings}  ",
          style: TextStyle(fontSize: getHeight(18), fontWeight: Constants.bold),
        ),
        InkWell(
          onTap: () =>
              Navigator.pushNamed(context, "/review_ratings", arguments: index),
          child: Text(
            "(${mebels.reviews!.length} reviews)",
            style: TextStyle(
                color: Constants.color30, decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
