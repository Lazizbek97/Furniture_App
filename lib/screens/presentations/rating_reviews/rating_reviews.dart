import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../core/models/furniture_model.dart';
import '../../../core/utils/constants.dart';
import '../../providers/home_page_provider/homepage_provider.dart';

class RatingReviews extends StatelessWidget {
  RatingReviews({Key? key, required this.index}) : super(key: key);

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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Rating & Reviews",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: getHeight(116),
              width: getWidth(335),
              child: Container(
                height: getHeight(100),
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: getHeight(100),
                      width: getHeight(100),
                      margin: EdgeInsets.only(right: getWidth(20)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(mebels.img![0].toString()),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mebels.name.toString(),
                          style: TextStyle(
                            color: Constants.color60,
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/ystar.svg"),
                            Text(
                              "  ${mebels.ratings}",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: Constants.bold),
                            ),
                          ],
                        ),
                        Text(
                          "${mebels.reviews!.length} reviews",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Constants.color30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: mebels.reviews!.length,
                itemBuilder: (__, _) => Stack(
                  children: [
                    Container(
                      height: getHeight(190),
                      width: getWidth(335),
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 15,
                            )
                          ]),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      mebels.reviews![_].name.toString(),
                                      style: TextStyle(
                                          fontWeight: Constants.semiBold),
                                    ),
                                    Row(
                                      children: List.generate(
                                          5,
                                          (index) => SvgPicture.asset(
                                              "assets/images/ystar.svg")),
                                    )
                                  ],
                                ),
                                Text(
                                  mebels.reviews![_].date.toString(),
                                  style: TextStyle(
                                      color: Constants.color80, fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Text(mebels.reviews![_].comment.toString()),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        left: getWidth(148),
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/commentchi.png"),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: getHeight(50),
        width: getWidth(334),
        child: FloatingActionButton(
          onPressed: () {
            print(mebels.reviews!.toList()[0].comment);
          },
          child: const Text("Write a review"),
          isExtended: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
