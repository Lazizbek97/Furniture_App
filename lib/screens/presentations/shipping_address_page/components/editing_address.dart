import 'package:flutter/material.dart';
import 'package:furniture_app/core/models/user_model.dart';
import 'package:furniture_app/core/services/shipping_address_service/shipping_address_service.dart';
import 'package:furniture_app/screens/providers/shipping_address_provider/shipping_adress_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/size_config.dart';

class EditingAdress extends StatefulWidget {
  EditingAdress({
    Key? key,
    required this.address,
  }) : super(key: key);

  ShippingAddress address;

  @override
  State<EditingAdress> createState() => _EditingAdressState();
}

class _EditingAdressState extends State<EditingAdress> {
  TextEditingController? _nameController;
  TextEditingController? _addressController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.address.name);
    _addressController = TextEditingController(text: widget.address.address);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      actionsAlignment: MainAxisAlignment.spaceAround,
      buttonPadding: const EdgeInsets.symmetric(vertical: 0),
      actions: [
        ElevatedButton(
          onPressed: () async {
            await context.read<ShippingAddressProvider>().checkAddressList();
            await ShippingPageService.deleteFromShipping(widget.address);
            Navigator.pop(context);
          },
          child: const Text(
            "Delete Address",
            style: TextStyle(color: Colors.red),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              side: const BorderSide(color: Colors.grey)),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.grey),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              side: const BorderSide(color: Colors.grey)),
        ),
        ElevatedButton(
          onPressed: () {
            ShippingPageService.updateAdress(
              address: widget.address,
              name: _nameController!,
              adressController: _addressController!,
            );
            Navigator.pop(context);
          },
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.green),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              side: const BorderSide(color: Colors.grey)),
        ),
      ],
      content: Container(
        height: getHeight(227),
        width: getWidth(335),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 25.0)],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
                child: TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: "Full Name",
                  ),
                ),
              ),
              const Divider(
                color: Color(0xffF0F0F0),
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _addressController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(hintText: "Address"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
