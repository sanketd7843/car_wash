import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:car_wash/view/SelectDayDateScreen/widget/notifcation_dialog.dart';

class DateTimePickerWidget2 extends StatefulWidget {
  @override
  _DateTimePickerWidget2State createState() => _DateTimePickerWidget2State();
}

class _DateTimePickerWidget2State extends State<DateTimePickerWidget2> {
  DateTime selectedDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('HH:mm \n dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(dateFormat.format(selectedDate)),
        RaisedButton(
          child: Text('Choose new date time'),
          onPressed: () async {
            showDateTimeDialog(context, initialDate: selectedDate,
                onSelectedDate: (selectedDate) {
              setState(() {
                this.selectedDate = selectedDate;
              });
            });
          },
        ),
      ],
    );
  }
}
