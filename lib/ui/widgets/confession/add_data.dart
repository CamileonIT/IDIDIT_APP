import 'package:flutter/material.dart';

import 'package:recovery/data/models/addiction.dart';
import 'package:recovery/services/addictiondb_helper.dart';
import 'package:recovery/ui/screens/settings.dart';
import 'package:recovery/ui/utils/util.dart';
import 'package:recovery/ui/widgets/confession/gradient.button.blue.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  Future<List<Addiction>> students;
  String _title;
  int _moneyWasted = 0;
  int _timeWasted = 0;
  bool isUpdate = false;
  int studentIdForUpdate;
  DBHelper dbHelper;
  final _moneyWastedController = TextEditingController();
  final _timeWastedController = TextEditingController();
  List _categories = [
    "Smoking",
    "Drinking",
    "Drugs",
    "Tablets",
    "Weed",
    "Porn",
    "Video Games",
    "Watching TV",
    "Impulsive Shopping",
    "Facebook",
    "Instagram",
    "Tik Tok",
    "Youtube",
    "Snapchat",
    "Fast Food",
    "Sugar"
        "Overreacting",
    "Meat",
    "Coke",
    "Coffee",
    "Gambling",
    "Procastination",
    "Cursing",
    "Lie",
    "Quarrel"
  ];
  List<DropdownMenuItem> _categoriesItems = [];

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    refreshStudentList();
    for (var i = 0; i < _categories.length; i++) {
      _categoriesItems.add(DropdownMenuItem(
        child: Text(_categories[i]),
        value: _categories[i],
      ));
    }
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
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(
            child: Image.asset(
              (_title == null)
                  ? "assets/images/select_image.png"
                  : "assets/images/addictions/$_title.png",
              fit: BoxFit.contain,
            ),
            width: 100,
          ),
          Form(
            key: _formStateKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    child: SearchableDropdown.single(
                      items: _categoriesItems,
                      value: _title,
                      hint: "Select one",
                      searchHint: "Select one",
                      onChanged: (value) {
                        setState(() {
                          _title = value;
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                ),
                //Title

                //Money Wasted

                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter Money Wasted';
                      }
                      if (value.trim() == "")
                        return "Only Numbers are Valid!!!";
                      return null;
                    },
                    onSaved: (value) {
                      _moneyWasted = int.parse(value);
                    },
                    controller: _moneyWastedController,
                    decoration: InputDecoration(
                        focusedBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                                color: Colors.purple,
                                width: 2,
                                style: BorderStyle.solid)),
                        // hintText: "Student Name",
                        labelText: "Money Wasted",
                        icon: Icon(
                          Icons.business_center,
                          color: Colors.purple,
                        ),
                        fillColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.purple,
                        )),
                  ),
                ),
                //Time Wasted
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter time Wasted';
                      }
                      if (value.trim() == "")
                        return "Only Numbers are Valid!!!";
                      return null;
                    },
                    onSaved: (value) {
                      _timeWasted = int.parse(value);
                    },
                    controller: _timeWastedController,
                    decoration: InputDecoration(
                        focusedBorder: new UnderlineInputBorder(
                            borderSide: new BorderSide(
                                color: Colors.purple,
                                width: 2,
                                style: BorderStyle.solid)),
                        // hintText: "Student Name",
                        labelText: "Time Wasted",
                        icon: Icon(
                          Icons.business_center,
                          color: Colors.purple,
                        ),
                        fillColor: Colors.white,
                        labelStyle: TextStyle(
                          color: Colors.purple,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GradientButtonBlue(
              onPress: () {
                if (_formStateKey.currentState.validate()) {
                  _formStateKey.currentState.save();
                  dbHelper.add(Addiction(null, _title,
                      DateTime.now().toString(), _moneyWasted, _timeWasted));
                }
                _moneyWastedController.text = '';
                _moneyWastedController.text = '';
                refreshStudentList();
                Navigator.pop(context);
              },
              text: "I Promise You",
            ),
          ),
          const Divider(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}
