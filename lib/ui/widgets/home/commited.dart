import 'package:flutter/material.dart';
import 'package:recovery/data/models/addiction.dart';
import 'package:recovery/services/achievement_calculator.dart';
import 'package:recovery/services/addictiondb_helper.dart';
import 'package:recovery/ui/utils/globals.dart' as globals;
import 'package:recovery/services/wastage_calculator.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Commited extends StatefulWidget {
  @override
  _CommitedState createState() => _CommitedState();
}

class _CommitedState extends State<Commited> {
  Future<List<Addiction>> students;
  bool isUpdate = false;
  int studentIdForUpdate;
  DBHelper dbHelper;
  int sumOfMoneyWasted = 0;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshStudentList();
  }

  refreshStudentList() {
    setState(() {
      students = dbHelper.getStudents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: students,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: snapshot.data.length,
            itemBuilder: (context, i) {
              sumOfMoneyWasted = sumOfMoneyWasted +
                  WastageCalculator.moneyWasted(
                      snapshot.data[i].lastSeen, snapshot.data[i].moneyWasted);

              globals.sumOfMoneyWasted = sumOfMoneyWasted;
              return Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Container(
                  decoration: _tileDecoration(),
                  child: ListTile(
                    leading: SizedBox(
                        width: 40,
                        child: Image.asset(
                            'assets/images/addictions/${snapshot.data[i].title}.png')),
                    title: Text(
                      '${snapshot.data[i].title}',
                      style: TextStyle(
                          fontFamily: "worksans",
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    subtitle: Text(
                      '${snapshot.data[i].lastSeen}',
                      style: TextStyle(
                          fontFamily: "worksans",
                          fontWeight: FontWeight.w300,
                          fontSize: 12),
                    ),
                    trailing: Column(
                      children: [
                        SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                              customWidths:
                                  CustomSliderWidths(progressBarWidth: 5),
                              size: 40),
                          min: 0,
                          max: 100,
                          initialValue:
                              AchievementCalculator.percentageAchievement(
                                  snapshot.data[i].lastSeen),
                        ),
                        Text(
                          "Next Achievement : ${AchievementCalculator.nextAchievement(snapshot.data[i].lastSeen)}",
                          style: TextStyle(
                              fontSize: 8, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        if (snapshot.data == null || snapshot.data.length == 0) {
          return Text('No Data Found');
        }
        return CircularProgressIndicator();
      },
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
          color: Colors.grey,
          offset: Offset(0, 0),
          blurRadius: 5,
          spreadRadius: 0)
    ],
  );
}
