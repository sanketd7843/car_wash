import 'package:car_wash/components/rounded_button.dart';
import 'package:car_wash/view/SelectAddressScreen/select_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:car_wash/constants.dart';

import 'package:intl/intl.dart';

void main() => runApp(SelectDayDate());

class SelectDayDate extends StatefulWidget {
  @override
  _SelectDayDateState createState() => _SelectDayDateState();
}

class _SelectDayDateState extends State<SelectDayDate> {
  final String appTitle = 'Book Your Slot';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: appTitle,
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime selectedDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('HH:mm \n dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [kPrimaryColor, kPrimaryColor, kPrimaryColor])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Select",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Date and Time",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        "Book Your Slot",
                                        style: TextStyle(
                                            color: Colors.grey.shade800,
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/Calendarphoto.png",
                                      height: h * 0.31,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Center(
                                          child: Text(
                                            dateFormat.format(selectedDate),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: kPrimaryColor,
                                                fontSize: 30.0),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 60,
                                        ),
                                        RoundedButton(
                                          text: "Select Date and Time",
                                          color: kPrimaryLightColor,
                                          textColor: Colors.black,
                                          press: () async {
                                            final selectedDate =
                                                await _selectDateTime(context);
                                            if (selectedDate == null) return;

                                            print(selectedDate);

                                            final selectedTime =
                                                await _selectTime(context);
                                            if (selectedTime == null) return;
                                            print(selectedTime);

                                            setState(() {
                                              this.selectedDate = DateTime(
                                                selectedDate.year,
                                                selectedDate.month,
                                                selectedDate.day,
                                                selectedTime.hour,
                                                selectedTime.minute,
                                              );
                                            });
                                          },
                                        ),
                                        RoundedButton(
                                          text: "Next",
                                          color: kPrimaryColor,
                                          textColor: Colors.white,
                                          press: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return SelectAddressScreen();
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<TimeOfDay> _selectTime(BuildContext context) {
  final now = DateTime.now();

  return showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
  );
}

Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(seconds: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
