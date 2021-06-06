import 'package:car_wash/view/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:car_wash/constants.dart';

import '../../../default_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              backgroundColor: kPrimaryMatch,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/images/accounts.png'),
                //fit: BoxFit.cover),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: kPrimaryColor),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.settings, color: kPrimaryColor),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyApp();
                        },
                      ),
                    );
                  },
                ), // overflow menu
                // PopupMenuButton<String>(
                //   onSelected: (String value) {},
                //   itemBuilder: (context) => [
                //     PopupMenuItem(
                //       value: "Settings",
                //       child: Text("Settings"),
                //     ),
                //   ],
                // )
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Container(
                  transform: Matrix4.translationValues(0, 55, 0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: kPrimaryMatch,
                    child: CircleAvatar(
                      radius: 47,
                      backgroundColor: kPrimaryMatch,
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Container(height: 70),
                Text(
                  "James Bond",
                  style: MyText.headline(context).copyWith(
                      color: Colors.grey[900], fontWeight: FontWeight.bold),
                ),
                Container(height: 3),
                Text('New York',
                    textAlign: TextAlign.center,
                    style: MyText.subhead(context)
                        .copyWith(color: Colors.grey[900])),
                Container(height: 25),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Name',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: kPrimaryColor,
                                  fontFamily: 'Cocon-Regular-Font',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: "James Bond",
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Email Id',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: kPrimaryColor,
                                  fontFamily: 'Cocon-Regular-Font',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: "JamesbBond@gmail.com",
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: kPrimaryColor,
                                  fontFamily: 'Cocon-Regular-Font',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: "********",
                            ),
                          ),
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(
                              'Mobile Number',
                              style: TextStyle(
                                  fontSize: 22.0,
                                  color: kPrimaryColor,
                                  fontFamily: 'Cocon-Regular-Font',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Flexible(
                          child: new TextField(
                            decoration: const InputDecoration(
                              hintText: "0987654321",
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(height: 23),
                Padding(
                  padding: const EdgeInsets.fromLTRB(28.0, 8.0, 28.0, 8.0),
                  child: DefaultButton(
                    text: "Save My Details",
                    press: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyText {
  static TextStyle display4(BuildContext context) {
    return Theme.of(context).textTheme.display4;
  }

  static TextStyle display3(BuildContext context) {
    return Theme.of(context).textTheme.display3;
  }

  static TextStyle display2(BuildContext context) {
    return Theme.of(context).textTheme.display2;
  }

  static TextStyle display1(BuildContext context) {
    return Theme.of(context).textTheme.display1;
  }

  static TextStyle headline(BuildContext context) {
    return Theme.of(context).textTheme.headline;
  }

  static TextStyle title(BuildContext context) {
    return Theme.of(context).textTheme.title;
  }

  static TextStyle medium(BuildContext context) {
    return Theme.of(context).textTheme.subhead.copyWith(
          fontSize: 18,
        );
  }

  static TextStyle subhead(BuildContext context) {
    return Theme.of(context).textTheme.subhead;
  }

  static TextStyle body2(BuildContext context) {
    return Theme.of(context).textTheme.body2;
  }

  static TextStyle body1(BuildContext context) {
    return Theme.of(context).textTheme.body1;
  }

  static TextStyle caption(BuildContext context) {
    return Theme.of(context).textTheme.caption;
  }

  static TextStyle button(BuildContext context) {
    return Theme.of(context).textTheme.button;
  }

  static TextStyle subtitle(BuildContext context) {
    return Theme.of(context).textTheme.subtitle;
  }

  static TextStyle overline(BuildContext context) {
    return Theme.of(context).textTheme.overline;
  }
}
