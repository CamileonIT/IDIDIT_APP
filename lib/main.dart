import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recovery/ui/screens/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recovery',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          iconTheme: IconThemeData(
            color: Colors.blue,
          )),
      home: LoginPage(),
    );
  }
}
