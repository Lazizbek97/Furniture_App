import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/core/models/user_model.dart';
import 'package:furniture_app/core/services/shipping_address_service/shipping_address_service.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:furniture_app/screens/presentations/shipping_address_page/components/editing_address.dart';
import 'package:furniture_app/screens/providers/shipping_address_provider/shipping_adress_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/constants.dart';

class ShippingAddressPage extends StatelessWidget {
  const ShippingAddressPage({Key? key}) : super(key: key);

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
          "Shipping address",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: ShippingPageService.userShippingStream,
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
            List<ShippingAddress> shippingAddresses =
                (snap.data!.data()!['shipping_address'] as List)
                    .map((e) => ShippingAddress.fromJson(e))
                    .toList();

            return shippingAddresses.isEmpty
                ? const Center(
                    child: Text("No Address registered yet"),
                  )
                : ListView.builder(
                    itemCount: shippingAddresses.length,
                    itemBuilder: (_, __) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: context
                                                  .watch<
                                                      ShippingAddressProvider>()
                                                  .checked ==
                                              __
                                          ? true
                                          : false,
                                          
                                      checkColor: Colors.white,
                                      activeColor: Constants.color30,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      onChanged: (v) {
                                        context
                                            .read<ShippingAddressProvider>()
                                            .chooseAsAdress(__);
                                      },
                                    ),
                                    Text(
                                      "Use as the shipping address",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: Constants.semiBold,
                                        color: Constants.color90,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => EditingAdress(
                                              address: shippingAddresses[__],
                                            ));
                                  },
                                  icon: SvgPicture.asset(
                                      "assets/images/edit.svg"),
                                ),
                              ],
                            ),
                            Container(
                              height: getHeight(127),
                              width: getWidth(335),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade300,
                                      blurRadius: 25.0)
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 8.0),
                                    child: Text(
                                      shippingAddresses[__].name.toString(),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      shippingAddresses[__].address.toString(),
                                      style:
                                          TextStyle(color: Constants.color80),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/adding_address"),
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
