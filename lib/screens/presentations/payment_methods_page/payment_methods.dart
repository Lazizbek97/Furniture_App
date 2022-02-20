import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/constants.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

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
          "Payment Method",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) => Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: getHeight(180),
                      width: getWidth(333),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: index % 2 == 0
                            ? const Color(0xff242424)
                            : const Color(0xff999999),
                      ),
                    ),
                    Positioned(
                      top: getHeight(24),
                      left: getWidth(31),
                      child: index % 2 == 0
                          ? SvgPicture.asset("assets/images/mastercard.svg")
                          : SvgPicture.asset("assets/images/visa.svg"),
                    ),
                    Positioned(
                      top: getHeight(62),
                      left: 31,
                      child: Text(
                        "**** **** **** 3947",
                        style: TextStyle(
                            fontWeight: Constants.semiBold,
                            fontSize: 20,
                            color: Colors.white,
                            letterSpacing: 3),
                      ),
                    ),
                    Positioned(
                      bottom: getHeight(20),
                      left: getWidth(31),
                      child: Column(
                        children: [
                          const Text(
                            "Card Holder Name ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "Lazizbek Fayziev",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: Constants.semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: getHeight(20),
                      right: getWidth(31),
                      child: Column(
                        children: [
                          const Text(
                            "Expiry Date",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            "05/23",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: Constants.semiBold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    child: Checkbox(
                      value: true,
                      checkColor: Colors.white,
                      activeColor: Constants.color30,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onChanged: (v) {},
                    ),
                  ),
                  const Text(
                    "Use as the shipping address",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
    );
  }
}
