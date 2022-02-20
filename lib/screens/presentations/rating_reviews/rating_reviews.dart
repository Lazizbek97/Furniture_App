import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/constants.dart';

class RatingReviews extends StatelessWidget {
  const RatingReviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/minimalstand.png"),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Minimal Stand",
                          style: TextStyle(
                            color: Constants.color60,
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/ystar.svg"),
                            Text(
                              "  4.5",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: Constants.bold),
                            ),
                          ],
                        ),
                        Text(
                          "10 reviews",
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
                itemCount: 10,
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
                                      "Lazizbek Fayziev",
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
                                  "10/01/2020",
                                  style: TextStyle(
                                      color: Constants.color80, fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          const Expanded(
                            flex: 8,
                            child: Text(
                                "Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price"),
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
          onPressed: () {},
          child: const Text("Write a review"),
          isExtended: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
