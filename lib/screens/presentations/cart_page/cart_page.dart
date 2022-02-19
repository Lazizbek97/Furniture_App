import 'package:flutter/material.dart';
import 'package:furniture_app/core/utils/constants.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/a_cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () =>Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        centerTitle: true,
        title: Text(
          "My Cart",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height:  getHeight(700),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: getHeight(503),
                width: double.infinity,
                child: ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: Constants.dividerColor,
                      );
                    },
                    itemBuilder: (context, index) {
                      return const A_Cart();
                    }),
              ),
              const PromoCodeEntry(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total:",
                    style: TextStyle(
                        fontSize: 20,
                        color: Constants.color80,
                        fontWeight: Constants.bold),
                  ),
                  Text(
                    "\$ 95.00",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: Constants.bold,
                        color: Constants.color30),
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(60),
                width: getWidth(335),
                child: ElevatedButton(
                    onPressed: () {}, child: const Text("Check out")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PromoCodeEntry extends StatelessWidget {
  const PromoCodeEntry({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(44),
      width: getWidth(335),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Enter your promo code",
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          suffixIcon: InkWell(
            onTap: () {
              
            },
            child: Container(
              height: getHeight(44),
              width: getHeight(44),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
