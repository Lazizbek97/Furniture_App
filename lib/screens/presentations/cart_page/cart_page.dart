import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/core/models/furniture_model.dart';
import 'package:furniture_app/core/models/user_model.dart';
import 'package:furniture_app/core/utils/constants.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/services/favorites_page_service/cart_page_service/cart_page_service.dart';
import 'components/a_cart.dart';
import 'components/promocode.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

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
          "My Cart",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: getHeight(700),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: getHeight(503),
                width: double.infinity,
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: CartPageService.userCartStream,
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snap) {
                      if (snap.hasError) {
                        return const Center(
                          child: Text("Somthing went wrong!"),
                        );
                      }

                      if (snap.data == null ||
                          UserModel.fromJson(snap.data!.docs.first.data())
                              .myCart!
                              .isEmpty) {
                        return const Center(
                          child: Text("Cart is Empty"),
                        );
                      }
                      final cartItems =
                          UserModel.fromJson(snap.data!.docs.first.data());

                      return ListView.separated(
                        itemCount: cartItems.myCart!.length,
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Constants.dividerColor,
                          );
                        },
                        itemBuilder: (context, index) {
                          return A_Cart(
                            model: Item.fromJson(cartItems.myCart![index]),
                          );
                        },
                      );
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
                    onPressed: () =>
                        Navigator.pushNamed(context, '/checkout_page'),
                    child: const Text("Check out")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
