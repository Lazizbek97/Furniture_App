import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../../core/models/furniture_model.dart';
import '../../../../core/utils/size_config.dart';
import 'package:furniture_app/core/utils/constants.dart';

import '../../../providers/furniture_provider/furniture_provider.dart';
import '../../../providers/home_page_provider/homepage_provider.dart';

class MenuButtons extends StatelessWidget {
  MenuButtons({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    var mebels = context.watch<Box<FurnitureModel>>().values.toList()[index];
    var home = context.watch<HomePageProvider>();

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
              color: home.menuIndex == index
                  ? Constants.color30
                  : const Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SvgPicture.asset(mebels.icon.toString()),
          ),
          Text(
            mebels.title.toString(),
            style: TextStyle(
              color: home.menuIndex == index
                  ? Constants.color30
                  : const Color(0xff999999),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
