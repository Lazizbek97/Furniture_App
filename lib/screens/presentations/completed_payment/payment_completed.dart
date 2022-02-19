import 'package:flutter/material.dart';
import 'package:furniture_app/core/utils/constants.dart';
import 'package:furniture_app/core/utils/size_config.dart';

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
              Stack(
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage("assets/images/success_back.png"),
                    ),
                  ),
                  const Center(
                    child: Image(
                      image: AssetImage("assets/images/success_front.png"),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: getWidth(163),
                    child: Image.asset("assets/images/checkmark.png"),
                  ),
                ],
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
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, "/home_page", (route) => false),
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
