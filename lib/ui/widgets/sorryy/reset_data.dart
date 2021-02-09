import 'package:flutter/material.dart';
import 'package:recovery/data/models/addiction.dart';
import 'package:recovery/services/addictiondb_helper.dart';
import 'package:recovery/ui/screens/settings.dart';
import 'package:recovery/ui/utils/util.dart';
import 'package:recovery/ui/widgets/confession/gradient.button.blue.dart';

class ResetData extends StatefulWidget {
  @override
  _ResetDataState createState() => _ResetDataState();
}

class _ResetDataState extends State<ResetData> {
  final GlobalKey _formStateKey = GlobalKey();
  Future<List<Addiction>> students;
  bool isUpdate = true;
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
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Settings()),
            );
          },
          child: Image.asset(
            'assets/images/icon_settings.png',
            color: PaypalColors.DarkBlue,
          ),
        ),
        title: SizedBox(
          height: 60,
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          Image.asset('assets/images/icon_school-bell.png',
              color: PaypalColors.DarkBlue)
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
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
                    key: _formStateKey,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      var addiction = snapshot.data[i];
                      return Container(
                        height: 80,
                        margin: EdgeInsets.all(9),
                        decoration: _tileDecoration(),
                        child: ListTile(
                            leading: SizedBox(
                                width: 40,
                                child: Image.asset(
                                    'assets/images/addictions/${addiction.title}.png')),
                            title: Text(
                              "${addiction.title}",
                              style: TextStyle(
                                  fontFamily: "worksans",
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            subtitle: Text(
                              "${DateTime.parse(addiction.lastSeen).toLocal().year}/${DateTime.parse(addiction.lastSeen).toLocal().month}/${DateTime.parse(addiction.lastSeen).toLocal().day}",
                              style: TextStyle(
                                  fontFamily: "worksans",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12),
                            ),
                            trailing: GradientButtonBlue(
                              onPress: () {
                                dbHelper.update(Addiction(
                                    addiction.id,
                                    addiction.title,
                                    DateTime.now().toString(),
                                    addiction.moneyWasted,
                                    addiction.timeWasted));
                                refreshStudentList();
                                Navigator.pop(context);
                              },
                              text: "Promise Again",
                            )),
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
