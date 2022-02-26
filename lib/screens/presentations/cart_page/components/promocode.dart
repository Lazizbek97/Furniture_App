import 'package:flutter/material.dart';
import 'package:furniture_app/screens/providers/cart_provider/cart_provider.dart';
import 'package:furniture_app/screens/providers/checkout_provider/checkout_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/size_config.dart';

class PromoCodeEntry extends StatefulWidget {
  const PromoCodeEntry({
    Key? key,
  }) : super(key: key);

  @override
  State<PromoCodeEntry> createState() => _PromoCodeEntryState();
}

class _PromoCodeEntryState extends State<PromoCodeEntry> {
  String promoCode = '12345';
  String error = "e";
  bool pcodeEntered = false;
  TextEditingController pcodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(44),
      width: getWidth(335),
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: pcodeController,
          onChanged: (value) {
            value != '' ? pcodeEntered = true : pcodeEntered = false;
            setState(() {});
          },
          decoration: InputDecoration(
            labelText: "Enter your promo code",
            contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            suffixIcon: InkWell(
              onTap: () {
                checkPromoCode();
              },
              child: Container(
                height: getHeight(44),
                width: getHeight(44),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: pcodeEntered
                    ? const Icon(
                        Icons.check,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  checkPromoCode() async {
    if (pcodeController.text == promoCode) {
      await context.read<CheckOutProvider>().addDiscount(10);
      context.read<CartProvider>().totalSum(discount: 10);
    }
  }
}
