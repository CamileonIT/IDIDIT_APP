import 'package:flutter/material.dart';
import 'file:///C:/Users/CharukaWijethunga/AndroidStudioProjects/recovery/lib/ui/widgets/home/quit_tile.dart';
import 'package:recovery/ui/widgets/achievements/achieved_quit_tile.dart';

class Achievements extends StatefulWidget {
  @override
  _AchievementsState createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          AchievedQuitTile(),
          AchievedQuitTile(),
          AchievedQuitTile(),
          AchievedQuitTile(),
          AchievedQuitTile(),
        ],
      ),
    );
  }
}
