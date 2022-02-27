import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/core/models/user_model.dart';
import 'package:furniture_app/core/services/payment_service/payment_service.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:furniture_app/screens/providers/payment_provider/payment_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

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
          "Payment Method",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: PaymentPageService.userPaymentStream,
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snap) {
              if (snap.hasError) {
                return const Center(
                  child: Text("Somthing went wrong"),
                );
              } else if (snap.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text("Loading..."),
                );
              }
              List<PaymentMethod> paymentMethods =
                  (snap.data!.data()!['payment_methods'] as List)
                      .map((e) => PaymentMethod.fromJson(e))
                      .toList();

              return paymentMethods.isEmpty
                  ? const Center(
                      child: Text("No Cart registered yet"),
                    )
                  : ListView.builder(
                      itemCount: paymentMethods.length,
                      itemBuilder: (context, index) => Dismissible(
                        key: UniqueKey(),
                        background: const SizedBox(),
                        direction: DismissDirection.endToStart,
                        secondaryBackground: Align(
                          alignment: const Alignment(0.6, 0),
                          child: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.red,
                            size: getHeight(70),
                          ),
                        ),
                        onDismissed: (v) {
                          PaymentPageService.deleteFromPaymentMethod(
                              model: paymentMethods[index]);
                        },
                        child: Column(
                          children: [
                            Center(
                              child: Stack(
                                children: [
                                  Container(
                                    height: getHeight(180),
                                    width: getWidth(333),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: index % 2 == 0
                                          ? const Color(0xff242424)
                                          : const Color(0xff999999),
                                    ),
                                  ),
                                  Positioned(
                                    top: getHeight(24),
                                    left: getWidth(31),
                                    child: index % 2 == 0
                                        ? SvgPicture.asset(
                                            "assets/images/mastercard.svg")
                                        : SvgPicture.asset(
                                            "assets/images/visa.svg"),
                                  ),
                                  Positioned(
                                    top: getHeight(62),
                                    left: 31,
                                    child: Text(
                                      "**** **** **** ${paymentMethods[index].cardNumber.toString().substring(paymentMethods[index].cardNumber.toString().length - 4)}",
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Card Holder Name ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          paymentMethods[index]
                                              .holderName
                                              .toString(),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Expiry Date",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          paymentMethods[index]
                                              .expirationDate
                                              .toString(),
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
                            Row(
                              children: [
                                SizedBox(
                                  child: Checkbox(
                                    value: context
                                                .watch<PaymentProvider>()
                                                .checked ==
                                            index
                                        ? true
                                        : false,
                                    checkColor: Colors.white,
                                    activeColor: Constants.color30,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    onChanged: (v) {
                                      context
                                          .read<PaymentProvider>()
                                          .chooseAsPaymentMethod(index);
                                    },
                                  ),
                                ),
                                const Text(
                                  "Use as the shipping address",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/adding_payment_method"),
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
