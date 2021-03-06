import 'package:flutter/material.dart';
import 'package:furniture_app/core/utils/constants.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:furniture_app/screens/providers/cart_provider/cart_provider.dart';
import 'package:furniture_app/screens/providers/payment_provider/payment_provider.dart';
import 'package:furniture_app/screens/providers/shipping_address_provider/shipping_adress_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/checkout_provider/checkout_provider.dart';
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
                child: Consumer<CartProvider>(
                  builder: ((context, cartItems, child) {
                    final cartItems =
                        context.watch<CartProvider>().cartItems.values.toList();

                    return cartItems.isEmpty
                        ? const Center(
                            child: Text("Cart is Empty"),
                          )
                        : ListView.separated(
                            itemCount: cartItems.length,
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: Constants.dividerColor,
                              );
                            },
                            itemBuilder: (context, index) {
                              return A_Cart(
                                model: cartItems[index],
                              );
                            },
                          );
                  }),
                ),
              ),
              const PromoCodeEntry(),
              context.watch<CheckOutProvider>().discount != 0
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Discount:"),
                        Text(
                            "-${context.watch<CheckOutProvider>().discount.toString()} \$")
                      ],
                    )
                  : const SizedBox(
                      height: 0,
                    ),
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
                    "\$ ${context.watch<CartProvider>().total}",
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
                    onPressed: () async {
                      final cartItems =
                        await  Provider.of<CartProvider>(context, listen: false)
                              .cartItems
                              .values
                              .toList();

                      cartItems.isNotEmpty
                          ? await context
                              .read<ShippingAddressProvider>()
                              .checkAddressList()
                              .then((value)async {
                              if (value) {
                              await  context
                                    .read<PaymentProvider>()
                                    .checkPaymentMethodList()
                                    .then((v) => v
                                        ? Navigator.pushNamed(
                                            context, '/checkout_page')
                                        : Navigator.pushNamed(
                                            context, '/payment_methods'));
                              } else {
                                Navigator.pushNamed(
                                    context, '/shipping_address');
                              }
                            })
                          : null;
                    },
                    child: const Text("Check out")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
