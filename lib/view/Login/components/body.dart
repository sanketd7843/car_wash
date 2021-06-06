import 'dart:convert';
import 'dart:developer';

import 'package:car_wash/model/userLoginModels/UserLoginModel.dart';
import 'package:car_wash/view/HomeScreen/home_screen.dart';
import 'package:car_wash/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:car_wash/view/Login/components/background.dart';
import 'package:car_wash/view/Signup/signup_screen.dart';
import 'package:car_wash/components/already_have_an_account_acheck.dart';
import 'package:car_wash/components/rounded_button.dart';
import 'package:car_wash/components/rounded_input_field.dart';
import 'package:car_wash/components/rounded_password_field.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;
  UserLoginModel userLoginModel;

  Future getListUser() async {
    try {
      isLoading = true;
      var request = http.Request(
          'POST',
          Uri.parse(
              'http://192.168.1.12/carApp/public/api/user-registration?email=sammy12@gmail.com&password=123456&user_firstname=sammy&user_middlename=sammy&user_lastname=sammy&api_key=qwertyuioplkjhgfdsa&user_type='));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var resp = await response.stream.bytesToString();
        log("logss:" + jsonEncode(resp));
      } else {
        print(response.reasonPhrase);
      }
    } on Exception catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @override
  void initState() {
    getListUser();

    super.initState();
  }

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
