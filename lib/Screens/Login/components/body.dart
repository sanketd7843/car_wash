import 'package:car_wash/Screens/HomeScreen/home_screen.dart';
import 'package:car_wash/constants.dart';
import 'package:flutter/material.dart';
import 'package:car_wash/Screens/Login/components/background.dart';
import 'package:car_wash/Screens/Signup/signup_screen.dart';
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
              "LOGIN",
              style: TextStyle(
                fontSize: 23,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/splash.png",
                height: size.height * 0.40,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyApp();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
