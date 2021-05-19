import 'package:car_wash/Screens/CanceledScreen/canceled_screen.dart';
import 'package:car_wash/Screens/PendingScreen/pending_screen.dart';
import 'package:car_wash/constants.dart';
import 'package:car_wash/model/history_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Body> {
  // Current selected
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Center(
                child: Text(
              'Orders',
              style: TextStyle(color: kPrimaryColor),
            )),
            bottom: TabBar(
              labelColor: kPrimaryColor,
              tabs: [
                Tab(text: "Cancelled"),
                Tab(text: "Pending"),
                Tab(text: "Accepted")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              CanceledScreen(),
              PendingScreen(),
              PendingScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
