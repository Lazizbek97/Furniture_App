import 'package:flutter/material.dart';
import 'package:furniture_app/core/utils/constants.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../../core/models/furniture_model.dart';
import '../../../../core/utils/size_config.dart';

import '../../../../core/widgets/barbutton.dart';
import '../../../providers/furniture_provider/furniture_provider.dart';

class ItemCard extends StatelessWidget {
   ItemCard({
    Key? key,
    required this.index
  }) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    var mebels = context.watch<Box<FurnitureModel>>().values.toList();
    var home = context.watch<HomePageProvider>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getWidth(10)),
      width: getWidth(157),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, "/about_page", arguments: index),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 8,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(mebels[home.menuIndex]
                              .items![index]
                              .img![0]
                              .toString()),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () {},
                        child: const BagButton(),
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mebels[home.menuIndex].items![index].name.toString(),
                  ),
                  Text(
                    "\$ ${mebels[home.menuIndex].items![index].price}",
                    style: TextStyle(
                        color: Constants.color30, fontWeight: Constants.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
