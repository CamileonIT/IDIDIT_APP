import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recovery/ui/pages/send1.dart';
import 'package:recovery/ui/utils/util.dart';

class Confession extends StatefulWidget {
  @override
  _ConfessionState createState() => _ConfessionState();
}

class _ConfessionState extends State<Confession> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: Text("You are not Alone"),
          ),
          SizedBox(height: 15),
          Divider(
            height: 0.1,
            color: Color.fromRGBO(0, 0, 0, 0.3),
          ),
        ],
      ),
    );
  }
}
