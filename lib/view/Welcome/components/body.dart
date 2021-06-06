import 'package:car_wash/view/HomeScreen/home_screen.dart';
import 'package:car_wash/view/Login/login_screen.dart';
import 'package:car_wash/view/SelectAddressScreen/select_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:car_wash/view/Signup/signup_screen.dart';
import 'package:car_wash/view/Welcome/components/background.dart';
import 'package:car_wash/components/rounded_button.dart';
import 'package:car_wash/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Mi Carwa",
              style: TextStyle(
                fontSize: 23,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/login.png",
              height: size.height * 0.40,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              color: kPrimaryColor,
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
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
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
