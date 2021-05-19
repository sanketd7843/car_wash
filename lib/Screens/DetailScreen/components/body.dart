import 'package:car_wash/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey.shade100,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/carwash.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                        top: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 32,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.share,
                              color: kPrimaryColor,
                              size: 32,
                            ),
                            onPressed: () => debugPrint('upload pressed'),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 215),
                        height: 65,
                        width: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(top: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Alex Car Washing',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0),
                          child: RatingBarIndicator(
                            rating: 2.75,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 14.0,
                            direction: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  margin: EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                          ),
                        ),
                        child: FlatButton(
                          child: Text('Description'),
                          onPressed: () => debugPrint('Description'),
                          textColor: Colors.black,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 2,
                        color: Colors.white,
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.grey.shade200),
                        child: FlatButton(
                          child: Text('Timing'),
                          onPressed: () => debugPrint('Timing'),
                          textColor: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 2,
                        color: Colors.white,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                            )),
                        child: FlatButton(
                          child: Text('Reviews'),
                          onPressed: () => debugPrint('Reviews'),
                          textColor: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.shade100,
                  margin: EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 30,
                  ),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ut accumsan augue. Morbi fringilla pharetra dui at tincidunt. Nullam vitae lectus est. Mauris euismod, odio sed facilisis maximus, risus eros dictum est, id interdum erat magna non nisi. Nam ornare, enim eu rutrum rutrum, lacus magna tincidunt justo, consectetur vestibulum risus elit non mi. In lobortis tortor vel leo consectetur, fermentum cursus orci vestibulum. ",
                    textAlign: TextAlign.justify,
                  ),
                ),
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 88.0, 18.0, 18.0),
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 1,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.phone,
                                      color: Colors.grey.shade400,
                                    ),
                                    onPressed: () => debugPrint('hello'),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 10,
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 1,
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.location_on,
                                      color: Colors.grey.shade400,
                                    ),
                                    onPressed: () => debugPrint('hello'),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 10,
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              flex: 3,
                              child: Container(
                                width: 120,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: Center(
                                  child: FlatButton(
                                    child: Text(
                                      'Book Now',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () => debugPrint('hello'),
                                  ),
                                ),
                              ),
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
      ),
    );
  }
}
