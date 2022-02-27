import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/size_config.dart';
import '../../../providers/auth_provider/auth_provider.dart';

class EditNameEmail extends StatefulWidget {
  EditNameEmail({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  String name;
  String email;

  @override
  State<EditNameEmail> createState() => _EditNameEmailState();
}

class _EditNameEmailState extends State<EditNameEmail> {
  TextEditingController? _nameController;
  TextEditingController? _emailController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.name);
    _emailController = TextEditingController(text: widget.email);
  }

  @override
  Widget build(BuildContext context) {
    var user = context.watch<AuthProvider>().fireBaseAuth.currentUser;

    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      actionsAlignment: MainAxisAlignment.spaceAround,
      buttonPadding: const EdgeInsets.symmetric(vertical: 0),
      actions: [
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
          onPressed: () async {
            await context.read<AuthProvider>().updateUserNameEmail(
                _nameController!.text, _emailController!.text);

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
        height: getHeight(147),
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
                  controller: _emailController,
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
