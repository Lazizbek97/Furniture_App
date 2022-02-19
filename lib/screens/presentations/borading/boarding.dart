import 'package:flutter/material.dart';
import 'package:furniture_app/core/utils/constants.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class Boarding extends StatelessWidget {
  const Boarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(Constants.boardingImage),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(getWidth(30), getHeight(231), 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Make Your",
                    style: GoogleFonts.gelasio(
                        fontSize: Constants.boardingTitle2,
                        color: Constants.discTextColor,
                        fontWeight: Constants.semiBold),
                  ),
                  SizedBox(
                    height: getHeight(10),
                  ),
                  Text(
                    "HOME BEAUTIFUL",
                    style: GoogleFonts.gelasio(
                      fontSize: Constants.boardingTitle1,
                      color: Colors.black,
                      fontWeight: Constants.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getHeight(40),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: getWidth(61),
              ),
              child: Text(
                "The best simple place where you discover most wonderful furnitures and make your home beautiful",
                style: GoogleFonts.nunitoSans(
                  color: Constants.subtitleTextColor,
                  fontSize: 18,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: getHeight(180)),
                child: SizedBox(
                  height: getHeight(54),
                  width: getWidth(159),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Get Sarted"),
                    style: ElevatedButton.styleFrom(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
