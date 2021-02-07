import 'package:flutter/material.dart';
import 'package:recovery/services/database_helper.dart';

class DB_Test extends StatefulWidget {
  @override
  _DB_TestState createState() => _DB_TestState();
}

class _DB_TestState extends State<DB_Test> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              RaisedButton(
                child: Text("Read"),
                onPressed: _read,
              ),
              RaisedButton(
                child: Text("Save"),
                onPressed: _save,
              ),
              RaisedButton(
                child: Text("Delete"),
                onPressed: _delete,
              ),
              RaisedButton(
                child: Text("Update"),
                onPressed: _update,
              ),
              RaisedButton(
                child: Text("Query All"),
                onPressed: _queryAll,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_read() async {
  DatabaseHelper helper = DatabaseHelper.instance;
  int rowId = 1;
  Addiction addiction = await helper.queryWord(rowId);
  if (addiction == null) {
    print('read row $rowId: empty');
  } else {
    print('read row $rowId: ${addiction.active} ${addiction.lastSeen}');
  }
}

_save() async {
  Addiction addiction = Addiction();
  addiction.active = "True";
  addiction.lastSeen = "Yessterday";
  addiction.moneyWasted = 20;
  addiction.timeWasted = 40;
  DatabaseHelper helper = DatabaseHelper.instance;
  int id = await helper.insert(addiction);
  print('inserted row: $id');
}

_delete() async {
  final helper = DatabaseHelper.instance;
  int id = 2;
  int count = await helper.deleteWord(id);
  print('deleted $count row(s)');
}

_update() async {
  Addiction addiction = Addiction();
  addiction.id = 1;
  addiction.active = "False";
  addiction.lastSeen = "Today";
  addiction.moneyWasted = 20;
  addiction.timeWasted = 40;
  final helper = DatabaseHelper.instance;
  int count = await helper.update(addiction);
  print('updated $count row(s)');
}

_queryAll() async {
  DatabaseHelper helper = DatabaseHelper.instance;
  final addictions = await helper.queryAllWords();
  if (addictions != null) {
    addictions.forEach((addiction) {
      print('row ${addiction.id}: ${addiction.active} ${addiction.lastSeen}');
    });
  }
}
