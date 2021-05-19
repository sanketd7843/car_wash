import 'package:flutter/material.dart';
import 'package:car_wash/Screens/Login/login_screen.dart';
import 'package:car_wash/Screens/Signup/components/background.dart';
import 'package:car_wash/Screens/Signup/components/or_divider.dart';
import 'package:car_wash/Screens/Signup/components/social_icon.dart';
import 'package:car_wash/components/already_have_an_account_acheck.dart';
import 'package:car_wash/components/rounded_button.dart';
import 'package:car_wash/components/rounded_input_field.dart';
import 'package:car_wash/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.07),
            Text(
              "SIGNUP",
              style: TextStyle(
                fontSize: 23,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w700,
              ),
            ),
            Image.asset(
              "assets/images/signupgreen.png",
              height: size.height * 0.30,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
