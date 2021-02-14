import 'package:flutter/material.dart';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:recovery/services/sign_in.dart';
import 'package:recovery/ui/utils/util.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login_page.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        child: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: Icon(CommunityMaterialIcons.close_circle),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 140.0,
                    height: 140.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: new NetworkImage(imageUrl)))),
                SizedBox(height: 25),
                Text(
                  '$name',
                  style: TextStyle(
                      fontFamily: 'worksans',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(height: 25),
                SizedBox(
                  height: 25,
                  child: FlatButton(
                    color: PaypalColors.LightGrey,
                    textColor: PaypalColors.DarkBlue,
                    child: Text(
                      "camileonit.me/IDIDIT/",
                      style: TextStyle(
                          fontFamily: "worksans",
                          color: PaypalColors.DarkBlue,
                          fontSize: 14),
                    ),
                    onPressed: () {
                      _launchURL();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "E-mail",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          // contentPadding: EdgeInsets.only(top: 40, bottom: 20),
                        ),
                        style: TextStyle(
                            fontFamily: "worksans",
                            color: Colors.white,
                            fontSize: 18),
                        initialValue: "$email",
                        enabled: false,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: 140,
                  child: FlatButton(
                    color: PaypalColors.LightGrey,
                    textColor: PaypalColors.DarkBlue,
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          fontFamily: "worksans",
                          color: PaypalColors.DarkBlue,
                          fontSize: 18),
                    ),
                    onPressed: () {
                      signOutGoogle();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }), ModalRoute.withName('/'));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
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

_launchURL() async {
  const url = 'http://www.camileonit.me/IDIDIT/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
