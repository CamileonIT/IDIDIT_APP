import 'package:flutter/material.dart';

class Achievements extends StatefulWidget {
  @override
  _AchievementsState createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Raise Money',
        style: TextStyle(fontFamily: "worksans", fontSize: 25),
      ),
    );
  }
}
