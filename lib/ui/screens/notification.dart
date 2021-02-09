import 'package:flutter/material.dart';
import 'package:recovery/services/quote_data.dart';

class NotificationView extends StatefulWidget {
  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.blue,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: SizedBox(
            height: 60,
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: QuoteData());
  }
}
