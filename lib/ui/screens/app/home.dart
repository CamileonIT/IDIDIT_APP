import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:recovery/services/sign_in.dart';
import 'package:recovery/ui/screens/login_page.dart';
import 'package:recovery/ui/screens/profile.dart';
import 'package:recovery/ui/utils/util.dart';
import 'package:recovery/ui/widgets/home/commited.dart';
import 'package:recovery/ui/utils/globals.dart' as globals;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _debitCard(context),
          SizedBox(
            height: 5,
          ),
          Wrap(
            children: [
              SizedBox(
                child: Image.asset(globals.happiness > 50
                    ? "assets/images/happy_green.png"
                    : "assets/images/happy_red.png"),
                height: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.6,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
                  child: FAProgressBar(
                    size: 18,
                    animatedDuration: Duration(milliseconds: 4000),
                    currentValue: globals.happiness,
                    displayText: '%',
                    changeColorValue: 55,
                    changeProgressColor: Colors.green,
                    progressColor: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          _activityText(),
          Commited(),
        ],
      ),
    );
  }
}

Container _debitCard(context) {
  return Container(
    margin: EdgeInsets.all(15),
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/world_map.png"),
        fit: BoxFit.contain,
      ),
      color: Colors.white,
      border:
          Border.all(color: Colors.white, width: 0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(
        Radius.circular(5.0),
      ),
      boxShadow: [
        BoxShadow(
            color: PaypalColors.LightGrey19,
            offset: Offset(0, 3),
            blurRadius: 6,
            spreadRadius: 1)
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset('assets/images/logo.png', height: 20),
                SizedBox(width: 20),
                Text(
                  'SAVINGS',
                  style: TextStyle(
                      color: PaypalColors.DarkBlue,
                      fontFamily: "worksans",
                      fontSize: 12),
                ),
              ],
            ),
            Icon(Icons.info_outline, size: 18)
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
                width: 80, child: Image.asset('assets/images/chip_thumb.png')),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '\$',
                      style: TextStyle(fontFamily: "sfprotext", fontSize: 25),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '${globals.sumOfMoneyWasted}',
                      style: TextStyle(fontFamily: "sfprotext", fontSize: 25),
                    ),
                    SizedBox(width: 13),
                  ],
                ),
                Text(
                  'Available',
                  style: TextStyle(
                      fontFamily: "worksans",
                      color: PaypalColors.Grey,
                      fontSize: 12),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 25,
              child: FlatButton(
                color: PaypalColors.LightGrey,
                textColor: PaypalColors.DarkBlue,
                child: Text(
                  name != null ? "$name" : "Sign In",
                  style: TextStyle(
                      fontFamily: "worksans",
                      color: PaypalColors.DarkBlue,
                      fontSize: 12),
                ),
                onPressed: () {
                  (name == null)
                      ? Navigator.of(context).push(
                          MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                              return LoginPage();
                            },
                            fullscreenDialog: true,
                          ),
                        )
                      : Navigator.of(context).push(
                          MaterialPageRoute<Null>(
                            builder: (BuildContext context) {
                              return Profile();
                            },
                            fullscreenDialog: true,
                          ),
                        );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: 40,
                    height: 50,
                    child: Image.asset('assets/images/visa.png')),
                SizedBox(
                    width: 40,
                    height: 50,
                    child: Image.asset('assets/images/master_card.png')),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Container _activityText() {
  return Container(
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 1, color: PaypalColors.LightGrey19))),
    margin: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 5),
    padding: EdgeInsets.only(bottom: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          'I COMMIT TO QUIT',
          style: TextStyle(
              fontFamily: "worksans",
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
