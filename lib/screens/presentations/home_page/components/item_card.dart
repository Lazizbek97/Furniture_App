import 'package:flutter/material.dart';
import 'package:furniture_app/core/utils/constants.dart';

import '../../../../core/utils/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getWidth(10)),
      width: getWidth(157),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, "/about_page"),
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
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/black_lamp.png"),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          print("bag button");
                        },
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
                  const Text(
                    "Black Simple Lamp",
                  ),
                  Text(
                    "\$ 12.00",
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
