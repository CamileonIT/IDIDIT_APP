import 'package:flutter/material.dart';
import 'package:recovery/ui/pages/add/landing.dart';
import 'file:///C:/Users/CharukaWijethunga/AndroidStudioProjects/recovery/lib/ui/widgets/confession/gradient.button.blue.dart';
import 'package:recovery/ui/widgets/header.widget.dart';

class Confession extends StatefulWidget {
  @override
  _ConfessionState createState() => _ConfessionState();
}

class _ConfessionState extends State<Confession> {
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
                image: "assets/images/confession_main.png",
                onBackPress: () {
                  Navigator.pop(context);
                },
              ),
              ContentDetail(
                title: "You are not alone. Do you have any other addiction?",
                onPress: () {
                  showDialog(
                    context: context,
                    child: AlertDialog(
                      content: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Berhasil memesan tiket pendakian ke",
                              style: TextStyle(fontSize: 20),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: GradientButtonBlue(
                                text: "Konfirmasi",
                                onPress: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
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
          Text(
            "...",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.05,
            ),
          ),
          SizedBox(height: 25),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: GradientButtonBlue(
              text: "Yes I have. Please help me.",
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LandingPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
