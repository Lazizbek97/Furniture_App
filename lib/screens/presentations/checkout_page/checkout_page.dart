import 'package:flutter/material.dart';
import 'package:furniture_app/core/hive/hive_boxes.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:furniture_app/screens/providers/checkout_provider/checkout_provider.dart';
import 'package:furniture_app/screens/providers/shipping_address_provider/shipping_adress_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';
import '../../providers/cart_provider/cart_provider.dart';
import 'components/checkout_container.dart';
import 'components/checkout_details.dart';
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
                  editFunc: () {
                    Navigator.pushReplacementNamed(context, '/shipping_address');
                  },
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
                          context
                              .watch<ShippingAddressProvider>()
                              .addressModel!
                              .name
                              .toString(),
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
                          context
                              .watch<ShippingAddressProvider>()
                              .addressModel!
                              .address
                              .toString(),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    context.watch<CheckOutProvider>().discount != 0
                        ? CheckoutDetails(
                            title: "Discount:",
                            price: context
                                .watch<CheckOutProvider>()
                                .discount
                                .toString())
                        : const SizedBox(
                            height: 0,
                          ),
                    CheckoutDetails(
                        title: "Order:",
                        price: "${context.watch<CartProvider>().total}"),
                    CheckoutDetails(title: "Delivery:", price: "5.00"),
                    CheckoutDetails(
                        title: "Total:",
                        price: "${context.watch<CartProvider>().total + 5.0}"),
                  ],
                ),
              ),
              height: getHeight(155),
              width: getWidth(335),
            ),
            SizedBox(
              height: getHeight(60),
              width: getWidth(335),
              child: ElevatedButton(
                onPressed: () async {
                  await Boxes.getCartItems().clear();
                  context.read<CheckOutProvider>().addDiscount(0);
                  Navigator.pushNamed(context, "/payment_completed");
                },
                child: const Text("SUBMIT ORDER"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
