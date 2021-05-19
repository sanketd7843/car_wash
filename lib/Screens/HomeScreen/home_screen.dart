import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:car_wash/Screens/AppointmentScreen/appointment_screen.dart';
import 'package:car_wash/Screens/HistoryScreen/history_screen.dart';
import 'package:car_wash/Screens/MapScreen/map_screen.dart';
import 'package:car_wash/Screens/NearbyScreen/nearby_screen.dart';
import 'package:car_wash/Screens/OrdersScreen/orders_screen.dart';
import 'package:car_wash/Screens/Profile/profile_screen.dart';
import 'package:car_wash/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPackage(),
    );
  }
}

class MyPackage extends StatefulWidget {
  @override
  _MyPackageState createState() => _MyPackageState();
}

class _MyPackageState extends State<MyPackage> {
  int currentIndex = 0;
  List listOfColors = [
    Container(
      child: NearbyScreen(),
    ),
    Container(
      child: OrdersScreen(),
    ),
    Container(
      child: HistoryScreen(),
    ),
    Container(
      child: AppointmentScreen(),
    ),
    Container(
      child: ProfileScreen(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
        body: listOfColors[currentIndex],
        bottomNavigationBar: BottomNavyBar(
          containerHeight: h * 0.08,
          selectedIndex: currentIndex,
          onItemSelected: (index) {
            setState(
              () {
                currentIndex = index;
              },
            );
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                textAlign: TextAlign.center,
                activeColor: kPrimaryColor,
                inactiveColor: Colors.black),
            BottomNavyBarItem(
                icon: Icon(Icons.history),
                title: Text('History'),
                textAlign: TextAlign.center,
                activeColor: kPrimaryColor,
                inactiveColor: Colors.black),
            BottomNavyBarItem(
                icon: Icon(Icons.date_range_outlined),
                title: Text('Appointments'),
                activeColor: kPrimaryColor,
                textAlign: TextAlign.center,
                inactiveColor: Colors.black),
            BottomNavyBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
                textAlign: TextAlign.center,
                activeColor: kPrimaryColor,
                inactiveColor: Colors.black),
          ],
        ));
  }
}
