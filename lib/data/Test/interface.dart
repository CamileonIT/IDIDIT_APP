import 'package:flutter/material.dart';
import 'package:recovery/data/Test/interfaceDesign.dart';
import 'addData.dart';

class Interface extends StatefulWidget {
  @override
  _InterfaceState createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              RaisedButton(
                child: Text("Add Data"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddData()),
                  );
                },
              ),
              RaisedButton(
                child: Text("View Data"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ViewData1()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
