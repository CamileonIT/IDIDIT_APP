import 'package:flutter/material.dart';

import 'package:recovery/data/models/addiction.dart';

import 'package:recovery/services/achievement_calculator.dart';
import 'package:recovery/services/helper.dart';

class Achievements extends StatefulWidget {
  @override
  _AchievementsState createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  Future<List<Addiction>> students;
  bool isUpdate = false;
  int studentIdForUpdate;
  DBHelper dbHelper;

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 18,
          ),
          Expanded(
            child: FutureBuilder(
              future: students,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return Container(
                        height: 80,
                        margin: EdgeInsets.all(9),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        decoration: _tileDecoration(),
                        child: ListTile(
                          leading: SizedBox(
                              width: 40,
                              child: Image.asset(
                                  'assets/images/addictions/${snapshot.data[i].title}.png')),
                          title: Text(
                            "${snapshot.data[i].title}",
                            style: TextStyle(
                                fontFamily: "worksans",
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                            "${DateTime.parse(snapshot.data[i].lastSeen).toLocal().year}/${DateTime.parse(snapshot.data[i].lastSeen).toLocal().month}/${DateTime.parse(snapshot.data[i].lastSeen).toLocal().day}",
                            style: TextStyle(
                                fontFamily: "worksans",
                                fontWeight: FontWeight.w300,
                                fontSize: 12),
                          ),
                          trailing: Column(
                            children: [
                              SizedBox(
                                  height: 45,
                                  child:
                                      Image.asset('assets/images/trophy.png')),
                              Text(
                                "Last Achievement : ${AchievementCalculator.lastAchievement(snapshot.data[i].lastSeen)} ",
                                style: TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.bold),
                              )
                            ],
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
            ),
          ),
        ],
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
          color: Colors.grey,
          offset: Offset(0, 0),
          blurRadius: 5,
          spreadRadius: 0)
    ],
  );
}
