import 'package:car_wash/view/ReferAndEarn/refer_and_earn.dart';
import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        title: new Center(
            child: new Text(
          "Profile",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey.shade700),
        )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              ProfilePic(),
              SizedBox(height: 10),
              Text(
                "Sammy",
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              ProfileMenu(
                text: 'Refer and Earn',
                icon: "assets/icons/refer.png",
                press: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ReferAndEarnScreen();
                      },
                    ),
                  ),
                },
              ),
              ProfileMenu(
                text: "KYC",
                icon: "assets/icons/key.png",
                press: () {},
              ),
              ProfileMenu(
                text: "Wallet",
                icon: "assets/icons/wallet.png",
                press: () {},
              ),
              ProfileMenu(
                text: "Log Out",
                icon: "assets/icons/logout.png",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
