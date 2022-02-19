import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/utils/constants.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/color_picker.dart';
import 'components/plus_minus_item.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/minimalstand.png"),
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
                            "Minimal Stand",
                            style: GoogleFonts.gelasio(
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            "\$ 50",
                            style: TextStyle(
                                fontSize: 30, fontWeight: Constants.bold),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/images/ystar.svg"),
                              Text(
                                "  4.5",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: Constants.bold),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "  (50 reviews)",
                                    style: TextStyle(color: Constants.color30),
                                  ))
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
                    "Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
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
                        onTap: () {},
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
