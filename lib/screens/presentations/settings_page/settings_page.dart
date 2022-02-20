import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
          "Settings",
          style: GoogleFonts.merriweather(
            fontWeight: Constants.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
