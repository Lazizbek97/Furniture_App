import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/utils/constants.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../core/models/furniture_model.dart';
import '../../../core/services/favorites_page_service/favorites_service.dart';
import '../../providers/home_page_provider/homepage_provider.dart';
import 'components/color_picker.dart';
import 'components/plus_minus_item.dart';

class AboutPage extends StatelessWidget {
  AboutPage({Key? key, required this.index}) : super(key: key);

  int index;

  @override
  Widget build(BuildContext context) {
    var home = context.watch<HomePageProvider>();
    var mebels = context
        .watch<Box<FurnitureModel>>()
        .values
        .toList()[home.menuIndex]
        .items![index];
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: getHeight(455),
                  width: getWidth(323),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(mebels.img![0].toString()),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: getHeight(53),
                left: getWidth(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: getHeight(40),
                        width: getHeight(40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10, color: Colors.grey.shade300)
                            ]),
                        child: const Icon(Icons.keyboard_arrow_left_outlined),
                      ),
                    ),
                    Container(
                      height: getHeight(192),
                      width: getWidth(64),
                      margin: EdgeInsets.only(top: getHeight(96)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ColorChekcer(
                            child: const Text(""),
                            color: Colors.white,
                          ),
                          ColorChekcer(
                            child: const Icon(
                              Icons.check,
                              color: Colors.black,
                            ),
                            color: const Color(0xffB4916C),
                          ),
                          ColorChekcer(
                            child: const Text(""),
                            color: const Color(0xffE4CBAD),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.grey.shade300,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: getHeight(126),
                  width: getWidth(325),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mebels.name.toString(),
                            style: GoogleFonts.gelasio(
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "\$ ${mebels.price}",
                            style: TextStyle(
                                fontSize: 30, fontWeight: Constants.bold),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/ystar.svg"),
                              Text(
                                "  ${mebels.ratings}  ",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: Constants.bold),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, "/review_ratings",
                                    arguments: index),
                                child: Text(
                                  "(${mebels.reviews!.length} reviews)",
                                  style: TextStyle(
                                      color: Constants.color30,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: getHeight(30),
                        width: getWidth(113),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const PlusMinusItem(icon: Icon(Icons.add)),
                            ),
                            const Text(
                              "1",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const PlusMinusItem(
                                icon: Icon(Icons.remove),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: getHeight(100),
                  width: getWidth(325),
                  child: Text(
                    mebels.disc.toString(),
                    style: TextStyle(
                        color: Constants.color60, fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(
                  height: getHeight(60),
                  width: getWidth(325),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          FavoritesPageService.addItemToFavorites(mebels);
                        },
                        child: Container(
                          height: getHeight(60),
                          width: getHeight(60),
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffF0F0F0)),
                          child: SvgPicture.asset("assets/images/bookmark.svg"),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(60),
                        width: getWidth(250),
                        child: ElevatedButton(
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, "/cart_page"),
                          child: const Text("Add to cart"),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
