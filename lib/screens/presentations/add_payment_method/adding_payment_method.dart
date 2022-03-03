import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/services/payment_service/payment_service.dart';
import 'package:furniture_app/screens/presentations/add_payment_method/components/text_input_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/size_config.dart';

class AddingPaymentMethodPage extends StatelessWidget {
  AddingPaymentMethodPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _scvNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: Text(
          "Add payment method",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: getHeight(717),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: getHeight(458),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            height: getHeight(180),
                            width: getWidth(333),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xff242424)),
                          ),
                          Positioned(
                              top: getHeight(24),
                              left: getWidth(31),
                              child: SvgPicture.asset(
                                  "assets/images/mastercard.svg")),
                          Positioned(
                            top: getHeight(62),
                            left: 31,
                            child: Text(
                              "**** **** **** XXXX",
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Card Holder Name ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "XXXXXXX",
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Expiry Date",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "XX/XX",
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
                    TextInputField(
                      controller: _nameController,
                      keyboarfType: TextInputType.name,
                      title: "Card Holder Name",
                      hintText: "Ex: Lazizbek Fayziev",
                      backColor: const Color(0xffF5F5F5),
                      borderColor: const Color(0xffF5F5F5),
                    ),
                    TextInputField(
                      controller: _cardNumberController,
                      keyboarfType: TextInputType.number,
                      title: "Card Numner",
                      hintText: "**** **** **** 3456",
                      backColor: Colors.white,
                      borderColor: const Color(0xffDBDBDB),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: getWidth(157),
                          child: TextInputField(
                            keyboarfType: TextInputType.number,
                            controller: _scvNumberController,
                            title: "CVV",
                            hintText: "Ex: 123",
                            backColor: const Color(0xffF5F5F5),
                            borderColor: const Color(0xffF5F5F5),
                          ),
                        ),
                        SizedBox(
                          width: getWidth(157),
                          child: TextInputField(
                            controller: _expiryController,
                            keyboarfType: TextInputType.number,
                            title: "Epiration Date",
                            hintText: "03/22",
                            backColor: Colors.white,
                            borderColor: const Color(0xffDBDBDB),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: getHeight(30)),
                child: SizedBox(
                  height: getHeight(60),
                  width: getWidth(335),
                  child: ElevatedButton(
                    onPressed: () async {
                      await PaymentPageService.addItemToPaymentMethod(
                        cardNumber: _cardNumberController,
                        expirationDate: _expiryController,
                        cvvCode: _scvNumberController,
                        holderName: _nameController,
                      );
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "ADD NEW CARD",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
