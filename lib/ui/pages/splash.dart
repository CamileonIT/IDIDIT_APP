import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:recovery/ui/pages/app.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 5),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => App()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: WavyAnimatedTextKit(
            textStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            text: [
              "Recovering...",
            ],
            isRepeatingAnimation: true,
          ),
        ),
      ),
    );
  }
}
