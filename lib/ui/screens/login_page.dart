import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:recovery/services/sign_in.dart';
import 'package:recovery/ui/screens/app.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                child: Image.asset("assets/images/logo.png"),
                width: 200,
              ),
              SizedBox(height: 50),
              loading
                  ? LoadingBouncingGrid.square(
                      size: 40,
                      backgroundColor: Colors.blue,
                    )
                  : _signInButton(),
              SizedBox(height: 100),
              Text(
                " Copyrights @ 2021  |  Developed By CamileonIT",
                style: TextStyle(fontSize: 10, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        setState(() {
          loading = true;
        });
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return App();
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
