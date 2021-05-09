import 'package:flutter/material.dart';
import 'package:car_wash/Screens/WalletScreen/theme/light_color.dart';
import 'package:car_wash/Screens/WalletScreen/widgets/balance_card.dart';
import 'package:car_wash/Screens/WalletScreen/widgets/title_text.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({Key key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  Widget _appBar() {
    return Row(
      children: <Widget>[
        Image(
          image: AssetImage('assets/images/user.png'),
        ),
        SizedBox(width: 15),
        TitleText(text: "Hello,"),
        Text(' Alex,',
            style: GoogleFonts.muli(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: LightColor.navyBlue2)),
        Expanded(
          child: SizedBox(),
        ),
        Icon(
          Icons.arrow_back_ios,
          color: Theme.of(context).iconTheme.color,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 35),
              _appBar(),
              SizedBox(
                height: 40,
              ),
              TitleText(text: "My wallet"),
              SizedBox(
                height: 20,
              ),
              BalanceCard(),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Container(
                  height: 180.0,
                  width: 270.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/walletimage.png'),
                      fit: BoxFit.fill,
                    ),
                    // shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          )),
    )));
  }
}
