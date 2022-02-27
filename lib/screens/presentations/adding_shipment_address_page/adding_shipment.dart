import 'package:flutter/material.dart';
import 'package:furniture_app/core/models/user_model.dart';
import 'package:furniture_app/core/services/shipping_address_service/shipping_address_service.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/constants.dart';
import 'components/input_field_container.dart';

class AddingShipmentAdressPage extends StatelessWidget {
  AddingShipmentAdressPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _zipcodeController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();

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
          "Add shipping address",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: getHeight(700),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InputFieldAdress(
                controller: _nameController,
                title: "Full name",
                hintText: "Ex: Lazizbek Fayziev",
                backColor: const Color(0xffF5F5F5),
                borderColor: const Color(0xffF5F5F5),
              ),
              InputFieldAdress(
                controller: _addressController,
                title: "Address",
                hintText: "Ex: 25 Robert Latouche Street",
                backColor: const Color(0xffF5F5F5),
                borderColor: const Color(0xffF5F5F5),
              ),
              InputFieldAdress(
                controller: _zipcodeController,
                title: "Zipcode (Postal Code)",
                ktype: TextInputType.number,
                hintText: "100001",
                backColor: Colors.white,
                borderColor: const Color(0xffDBDBDB),
              ),
              InputFieldAdress(
                controller: _countryController,
                title: "Country",
                hintText: "Ex: Uzebkistan",
                backColor: const Color(0xffF5F5F5),
                borderColor: const Color(0xffF5F5F5),
              ),
              InputFieldAdress(
                controller: _cityController,
                title: "City",
                hintText: "Ex: Tashkent",
                backColor: Colors.white,
                borderColor: const Color(0xffDBDBDB),
              ),
              InputFieldAdress(
                controller: _districtController,
                title: "District",
                hintText: "Ex: Mirobod",
                backColor: const Color(0xffF5F5F5),
                borderColor: const Color(0xffF5F5F5),
              ),
              SizedBox(
                height: getHeight(110),
              ),
              SizedBox(
                height: getHeight(60),
                width: getWidth(335),
                child: ElevatedButton(
                  onPressed: () async {
                    var newAddress = ShippingAddress(
                        address: _addressController.text,
                        city: _cityController.text,
                        country: _countryController.text,
                        district: _districtController.text,
                        name: _nameController.text,
                        zipCode: int.parse(_zipcodeController.text));
                    await ShippingPageService.addItemToShppingAddress(
                        newAddress);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "SAVE ADDRESS",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
