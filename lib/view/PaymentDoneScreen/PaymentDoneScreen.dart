import 'dart:io';

import 'package:car_wash/components/rounded_button.dart';
import 'package:car_wash/constants.dart';
import 'package:car_wash/view/HomeScreen/home_screen.dart';
import 'package:car_wash/view/SelectImagePan/SelectImagePan.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(PaymentModeScreen());
}

class PaymentModeScreen extends StatefulWidget {
  @override
  _PaymentModeScreen createState() => _PaymentModeScreen();
}

class _PaymentModeScreen extends State<PaymentModeScreen> {
  bool paymentdone = true;

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: new Text(
            'Select Payment Type',
            style: TextStyle(color: Colors.grey.shade700),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Container(
                            height: h * 0.4,
                            width: w * 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18.0, right: 18.0),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/visa.png",
                                                    width: 65,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 18.0),
                                                    child: Text(
                                                      "Visa",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18.0,
                                              right: 18.0,
                                              top: 24.0),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/mastercard.png",
                                                    width: 65,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 18.0),
                                                    child: Text(
                                                      "Mastercard",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18.0,
                                              right: 18.0,
                                              top: 24.0),
                                          child: new Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/paypal.png",
                                                    width: 65,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 18.0),
                                                    child: Text(
                                                      "Paypal",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 21,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Icon(
                                                Icons.keyboard_arrow_right,
                                                color: Colors.black,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(28.0, 8.0, 28.0, 8.0),
                  // ignore: deprecated_member_use
                  child: RoundedButton(
                    text: "Proceed",
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SelectPanCard();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
