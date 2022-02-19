import 'package:flutter/material.dart';
import 'package:furniture_app/core/utils/constants.dart';
import 'package:furniture_app/core/utils/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/widgets/login_top_part.dart';
import '../../../core/widgets/name_email_input.dart';
import '../../../core/widgets/password_input.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController _emailConstroller = TextEditingController();
  final TextEditingController _passwordConstroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffFDFDFD),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: getHeight(25)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LoginTopPart(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, getHeight(30), 0, getHeight(15)),
                        child: Text(
                          "Hello!",
                          style: GoogleFonts.merriweather(
                            color: Constants.color90,
                            fontSize: Constants.boardingTitle1,
                            fontWeight: Constants.regular,
                          ),
                        ),
                      ),
                      Text(
                        "WELCOME BACK",
                        style: GoogleFonts.merriweather(
                          color: Constants.color30,
                          fontSize: Constants.boardingTitle1,
                          fontWeight: Constants.bold,
                        ),
                      ),
                    ],
                  )),
              Container(
                height: getHeight(437),
                width: getWidth(345),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 20,
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    EmailNameInput(
                        constroller: _emailConstroller, hintText: "Email"),
                    PasswordInput(
                        passwordConstroller: _passwordConstroller,
                        hintText: "Password"),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontWeight: Constants.semiBold,
                          fontSize: 18,
                          color: Constants.color30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getHeight(50),
                      width: getWidth(285),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Log in"),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, "/signUp"),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontWeight: Constants.semiBold,
                          fontSize: 18,
                          color: Constants.color30,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
