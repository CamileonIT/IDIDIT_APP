class Addiction {
  int id;
  String title;
  String lastSeen;
  int moneyWasted;
  int timeWasted;
  int brokenPromises;
  Addiction(this.id, this.title, this.lastSeen, this.moneyWasted,
      this.timeWasted, this.brokenPromises);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'title': title,
      'lastSeen': lastSeen,
      'moneyWasted': moneyWasted,
      'timeWasted': timeWasted,
      'brokenPromises': brokenPromises,
    };
    return map;
  }

  Addiction.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    lastSeen = map['lastSeen'];
    moneyWasted = map['moneyWasted'];
    timeWasted = map['timeWasted'];
    brokenPromises = map['brokenPromises'];
  }
}
