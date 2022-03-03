import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';

import '../../../../core/models/furniture_model.dart';
import '../../../../core/utils/size_config.dart';

class BookmarkPart extends StatelessWidget {
  const BookmarkPart({
    Key? key,
    required this.favorites,
    required this.mebels,
  }) : super(key: key);

  final Box<Item> favorites;
  final Item mebels;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(60),
      width: getHeight(60),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xffF0F0F0)),
      child: favorites.containsKey(mebels.name)
          ? SvgPicture.asset(
              "assets/images/bookmark_filled.svg")
          : SvgPicture.asset(
              "assets/images/bookmark.svg"),
    );
  }
}
