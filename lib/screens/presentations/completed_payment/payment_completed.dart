import 'package:flutter/material.dart';
import 'package:furniture_app/core/utils/constants.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider/cart_provider.dart';

class PaymentCompleted extends StatelessWidget {
  const PaymentCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: getHeight(584),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SUCCESS!",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: Constants.bold,
                  color: Constants.color30,
                ),
              ),
              Center(
                child: SizedBox(
                  height: getHeight(300),
                  child: Lottie.network(
                      "https://assets2.lottiefiles.com/packages/lf20_cr7qpwnj.json"),
                ),
              ),
              SizedBox(
                height: getHeight(54),
                width: getWidth(283),
                child: Text(
                    "Your order will be delivered soon. Thank you for choosing our app!",
                    style: TextStyle(
                      fontSize: 18,
                      color: Constants.color60,
                    ),
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: getHeight(60),
                width: getWidth(315),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Track your orders"),
                ),
              ),
              SizedBox(
                height: getHeight(60),
                width: getWidth(315),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<CartProvider>().checkBox();

                    Navigator.pushNamedAndRemoveUntil(
                        context, "/home_page", (route) => false);
                  },
                  child: Text(
                    "BACK TO HOME",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: Constants.semiBold),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: const BorderSide(color: Colors.black)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
