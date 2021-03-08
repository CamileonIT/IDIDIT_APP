import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/CharukaWijethunga/AndroidStudioProjects/recovery/lib/ui/widgets/sorryy/gradient.button.red.dart';
import 'package:recovery/ui/widgets/header.widget.dart';
import 'package:recovery/ui/widgets/sorryy/reset_data.dart';

class Sorryy extends StatefulWidget {
  @override
  _SorryyState createState() => _SorryyState();
}

class _SorryyState extends State<Sorryy> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HeaderDetail(
                image: "assets/images/sorryy_main.png",
              ),
              ContentDetail(
                title: "Err! Did you break any promise?",
                onPress: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ContentDetail extends StatelessWidget {
  final String title;
  final Function onPress;

  const ContentDetail({
    Key key,
    @required this.title,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            this.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.06,
            ),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "-6 ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.05,
                    color: Colors.redAccent),
              ),
              SizedBox(
                child: Image.asset("assets/images/happy_red.png"),
                height: 26,
              )
            ],
          ),
          SizedBox(height: 25),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: GradientButtonRed(
              text: "Yes I did. Please forgive me.",
              onPress: () {
                Navigator.of(context).pushNamed(
                  '/reset',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
