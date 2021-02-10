import 'package:flutter/material.dart';

import 'package:recovery/data/models/addiction.dart';
import 'package:recovery/services/addictiondb_helper.dart';
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
      body: ListView(
        reverse: true,
        shrinkWrap: true,
        children: <Widget>[
          const Divider(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75),
            child: GradientButtonBlue(
              onPress: () {
                if (_title != null) {
                  if (_formStateKey.currentState.validate()) {
                    _formStateKey.currentState.save();
                    dbHelper.add(Addiction(
                        null,
                        _title,
                        DateTime.now().toString(),
                        _moneyWasted,
                        _timeWasted,
                        0));
                  }
                  _moneyWastedController.text = '';
                  _moneyWastedController.text = '';
                  refreshStudentList();
                  Navigator.pop(context);
                }
              },
              text: "I Promise You",
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            "Promise me you won't do this again.",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 30,
          ),
          Form(
            key: _formStateKey,
            child: Column(
              children: <Widget>[
                //Title
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: Container(
                    height: 80,
                    child: SearchableDropdown.single(
                      items: _categoriesItems,
                      value: _title,
                      hint: "Select here",
                      searchHint: "Select Your Addiction",
                      onChanged: (value) {
                        setState(() {
                          _title = value;
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                ),
                //Money Wasted

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("What were the average \ndaily expenses?"),
                    Container(
                      width: 100,
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
                          hintText: '',
                          contentPadding:
                              EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                //Time Wasted
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("How much time did you \nusually spend?"),
                    Container(
                      width: 100,
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
                          hintText: '',
                          contentPadding:
                              EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Image.asset(
            (_title == null)
                ? "assets/images/select_image.png"
                : "assets/images/addictions/$_title.png",
            fit: BoxFit.contain,
            height: 250,
          ),
        ],
      ),
    );
  }
}
