import 'dart:io';

import 'package:car_wash/components/rounded_button.dart';
import 'package:car_wash/constants.dart';
import 'package:car_wash/view/SelectImagePan/SelectImagePan.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(SelectAadahrCard());
}

class SelectAadahrCard extends StatefulWidget {
  @override
  _SelectAadahrCard createState() => _SelectAadahrCard();
}

class _SelectAadahrCard extends State<SelectAadahrCard> {
  File _image;

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return MaterialApp(
      title: 'Flutter ImagePicker Example',
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 170.0,
                    ),
                    Center(
                      child: Text(
                        "Upload Aadhar Card",
                        style: TextStyle(
                            color: Colors.grey.shade800,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Text(
                        "Upload your aadhar card so that \n      we can verify your account",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _image != null
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Container(
                              width: 300,
                              height: h * 0.31,
                              child: Image.file(
                                _image,
                              ),
                            ),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.only(top: 98.0, bottom: 38.0),
                            child: Text(
                              'No image selected',
                              style: TextStyle(
                                  color: Colors.grey.shade800,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          style:
                              ElevatedButton.styleFrom(primary: kPrimaryColor),
                          onPressed: () => _getImage(ImageSource.gallery),
                          icon: Icon(Icons.image),
                          label: Text('gallery'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () => _getImage(ImageSource.camera),
                          icon: Icon(Icons.camera),
                          style:
                              ElevatedButton.styleFrom(primary: kPrimaryColor),
                          label: Text('camera'),
                        ),
                      ],
                    ),
                  ],
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
                    text: "Upload Aadhar Card",
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

  _getImage(ImageSource imageSource) async {
    PickedFile imageFile = await picker.getImage(source: imageSource);

    if (imageFile == null) return;

    setState(
      () {
        _image = File(imageFile.path);
      },
    );
  }
}
