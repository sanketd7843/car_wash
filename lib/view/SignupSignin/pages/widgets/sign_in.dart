import 'dart:developer';
import 'dart:convert';
import 'package:car_wash/constants/alertHelper.dart';
import 'package:car_wash/constants/appStringsHelper.dart';
import 'package:car_wash/constants/sharedHelpers.dart';
import 'package:car_wash/constants/validatorHelper.dart';
import 'package:car_wash/view/NearbyScreen/nearby_screen.dart';

import 'package:car_wash/constants.dart';
import 'package:car_wash/constants/apiUrls.dart';
import 'package:car_wash/model/userLoginModels/UserLoginModel.dart';
import 'package:car_wash/networking/HttpService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:car_wash/view/SignupSignin/widgets/snackbar.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  HttpService httpService = HttpService();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  bool isLoading = false;
  sharedHelpers sharedHelper = sharedHelpers();

  Future loginUser() async {
    log("hello");
    var umail = loginEmailController.text;
    var upassword = loginPasswordController.text;

    if (umail == "" ||
        upassword == "" ||
        !(validatorHelper().validateEmail(umail))) {
      var dialog = CustomAlertDialog(
          title: "Alert",
          message: appStringsHelper.emptyFields,
          negativeBtnText: 'No');
      showDialog(context: context, builder: (BuildContext context) => dialog);
    } else {
      isLoading = true;
      try {
        FormData formData = FormData.fromMap({
          "email": umail,
          "password": upassword,
          "api_key": apiUrls.apiKey,
          "user_type": "1",
        });
        isLoading = false;
        Response resp = await Dio().post(apiUrls.loginUrl, data: formData);
        UserLoginModel u = UserLoginModel.fromJson(json.decode(resp.data));
        log(u.response + u.message);
        if (u.response == "200") {
          List<UserData> udata = u.data;
          log("hello world" + json.encode(udata[0]));
          saveUserData(udata[0]);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => NearbyScreen()));
        } else {
          var dialog = CustomAlertDialog(
              title: "Alert", message: u.message, negativeBtnText: 'No');
          showDialog(
              context: context, builder: (BuildContext context) => dialog);
        }
      } on DioError catch (e) {
        log(e.toString());
      }
    }
  }

  void saveUserData(dynamic data) async {
    sharedHelper.saveSharedPreferencesValue("userData", json.encode(data));
  }

  @override
  void initState() {
    super.initState();
  }

  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();

  bool _obscureTextPassword = true;

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isApiCallProcess = false;
    return Container(
      padding: const EdgeInsets.only(top: 43.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Card(
                elevation: 15.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Container(
                  width: 300.0,
                  height: 190.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          focusNode: focusNodeEmail,
                          controller: loginEmailController,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                              fontFamily: 'WorkSansSemiBold',
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.mail,
                              color: Colors.black,
                              size: 22.0,
                            ),
                            hintText: 'Email Address',
                            hintStyle: TextStyle(
                                fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                          ),
                          onSubmitted: (_) {
                            focusNodePassword.requestFocus();
                          },
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          focusNode: focusNodePassword,
                          controller: loginPasswordController,
                          obscureText: _obscureTextPassword,
                          style: const TextStyle(
                              fontFamily: 'WorkSansSemiBold',
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: const Icon(
                              Icons.lock,
                              size: 22.0,
                              color: Colors.black,
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                                fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                            suffixIcon: GestureDetector(
                              onTap: _toggleLogin,
                              child: Icon(
                                _obscureTextPassword
                                    ? Icons.remove_red_eye
                                    : Icons.close,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onSubmitted: (_) {
                            _toggleSignInButton();
                          },
                          textInputAction: TextInputAction.go,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              isLoading == true ? CircularProgressIndicator() : Container(),
              Container(
                margin: const EdgeInsets.only(top: 170.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: kPrimaryColor,
                      offset: Offset(1.0, 6.0),
                    ),
                    BoxShadow(
                      color: kPrimaryColor,
                      offset: Offset(1.0, 6.0),
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: <Color>[kPrimaryColor, kPrimaryColor],
                  ),
                ),
                child: MaterialButton(
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: 'WorkSansBold'),
                      ),
                    ),
                    onPressed: () => {
                          loginUser(),
                        }),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: 'WorkSansMedium'),
                )),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 10.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Container(
          //         decoration: const BoxDecoration(
          //           gradient: LinearGradient(
          //               colors: <Color>[
          //                 Colors.white10,
          //                 Colors.white,
          //               ],
          //               begin: FractionalOffset(0.0, 0.0),
          //               end: FractionalOffset(1.0, 1.0),
          //               stops: <double>[0.0, 1.0],
          //               tileMode: TileMode.clamp),
          //         ),
          //         width: 100.0,
          //         height: 1.0,
          //       ),
          //       const Padding(
          //         padding: EdgeInsets.only(left: 15.0, right: 15.0),
          //         child: Text(
          //           'Or',
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 16.0,
          //               fontFamily: 'WorkSansMedium'),
          //         ),
          //       ),
          //       Container(
          //         decoration: const BoxDecoration(
          //           gradient: LinearGradient(
          //               colors: <Color>[
          //                 Colors.white,
          //                 Colors.white10,
          //               ],
          //               begin: FractionalOffset(0.0, 0.0),
          //               end: FractionalOffset(1.0, 1.0),
          //               stops: <double>[0.0, 1.0],
          //               tileMode: TileMode.clamp),
          //         ),
          //         width: 100.0,
          //         height: 1.0,
          //       ),
          //     ],
          //   ),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.only(top: 10.0, right: 40.0),
          //       child: GestureDetector(
          //         onTap: () => CustomSnackBar(
          //             context, const Text('Facebook button pressed')),
          //         child: Container(
          //           padding: const EdgeInsets.all(15.0),
          //           decoration: const BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: Colors.white,
          //           ),
          //           child: const Icon(
          //             FontAwesomeIcons.facebookF,
          //             color: Color(0xFF0084ff),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(top: 10.0),
          //       child: GestureDetector(
          //         onTap: () => CustomSnackBar(
          //             context, const Text('Google button pressed')),
          //         child: Container(
          //           padding: const EdgeInsets.all(15.0),
          //           decoration: const BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: Colors.white,
          //           ),
          //           child: const Icon(
          //             FontAwesomeIcons.google,
          //             color: Color(0xFF0084ff),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  void _toggleSignInButton() {
    CustomSnackBar(context, const Text('Login button pressed'));
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
}

class Validate {}
