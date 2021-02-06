import 'package:flutter/material.dart';
import 'package:recovery/ui/utils/util.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class QuitTile extends StatefulWidget {
  @override
  _QuitTileState createState() => _QuitTileState();
}

class _QuitTileState extends State<QuitTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: _tileDecoration(),
      child: ListTile(
        leading: SizedBox(
            width: 40, child: Image.asset('assets/images/video_games.png')),
        title: Text(
          'Video Games',
          style: TextStyle(
              fontFamily: "worksans",
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        subtitle: Text(
          'Last : Jan 21, 2019',
          style: TextStyle(
              fontFamily: "worksans",
              fontWeight: FontWeight.w300,
              fontSize: 12),
        ),
        trailing: Column(
          children: [
            SleekCircularSlider(
              appearance: CircularSliderAppearance(
                  customWidths: CustomSliderWidths(progressBarWidth: 5),
                  size: 40),
              min: 0,
              max: 100,
              initialValue: 85,
            ),
            Text(
              "Next Achievement : 24 Hours",
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

BoxDecoration _tileDecoration() {
  return BoxDecoration(
    color: Colors.white,
    border: Border.all(color: Colors.white, width: 0, style: BorderStyle.solid),
    borderRadius: BorderRadius.all(
      Radius.circular(5.0),
    ),
    boxShadow: [
      BoxShadow(
          color: PaypalColors.LightGrey19,
          offset: Offset(0, 0),
          blurRadius: 3,
          spreadRadius: 1)
    ],
  );
}
