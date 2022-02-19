import 'package:flutter/material.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/constants.dart';
import 'components/checkout_container.dart';
import 'components/checkout_title.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

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
          "Check out",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                CheckoutTitle(
                  title: "Shipping Address",
                  editFunc: () {},
                ),
                CheckOutContainer(
                  height: getHeight(127),
                  width: getWidth(335),
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
                ),
              ],
            ),
            Column(
              children: [
                CheckoutTitle(
                  title: "Payment",
                  editFunc: () {},
                ),
                CheckOutContainer(
                  child: Row(
                    children: [
                      Image.asset("assets/images/master_card.png"),
                      Text(
                        "**** **** **** 3947",
                        style: TextStyle(
                          fontWeight: Constants.semiBold,
                        ),
                      )
                    ],
                  ),
                  height: getHeight(68),
                  width: getWidth(335),
                ),
              ],
            ),
            Column(
              children: [
                CheckoutTitle(
                  title: "Delivery method",
                  editFunc: () {},
                ),
                CheckOutContainer(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset("assets/images/dhl.png"),
                      ),
                      Text(
                        "Fast (2-3 days)",
                        style: TextStyle(
                          fontWeight: Constants.semiBold,
                        ),
                      )
                    ],
                  ),
                  height: getHeight(54),
                  width: getWidth(335),
                ),
              ],
            ),
            CheckOutContainer(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order:",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Constants.color80,
                              fontWeight: Constants.regular),
                        ),
                        const Text(
                          "\$ 95.00",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery:",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Constants.color80,
                              fontWeight: Constants.regular),
                        ),
                        const Text(
                          "\$ 5.00",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total:",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Constants.color80,
                              fontWeight: Constants.regular),
                        ),
                        Text(
                          "\$ 100.00",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: Constants.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              height: getHeight(135),
              width: getWidth(335),
            ),
            SizedBox(
              height: getHeight(60),
              width: getWidth(335),
              child: ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, "/payment_completed"),
                child: const Text("SUBMIT ORDER"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
