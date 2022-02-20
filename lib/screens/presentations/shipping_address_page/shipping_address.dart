import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/constants.dart';

class ShippingAddressPage extends StatelessWidget {
  const ShippingAddressPage({Key? key}) : super(key: key);

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
          "Shipping address",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (_, __) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            checkColor: Colors.white,
                            activeColor: Constants.color30,
                            
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                            ),
                            onChanged: (v) {},
                          ),
                          Text(
                            "Use as the shipping address",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: Constants.semiBold,
                                color: Constants.color90),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/images/edit.svg"),
                      ),
                    ],
                  ),
                  Container(
                    height: getHeight(127),
                    width: getWidth(335),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, blurRadius: 25.0)
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8.0),
                          child: Text(
                            "Lazizbek Fayziev",
                            style: TextStyle(
                              fontSize: 18,
                              color: Constants.color30,
                              fontWeight: Constants.bold,
                            ),
                          ),
                        ),
                        const Divider(
                          color: Color(0xffF0F0F0),
                          thickness: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "25 rue Robert Latouche, Nice, 06200, Côte D’azur, France",
                            style: TextStyle(color: Constants.color80),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
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
