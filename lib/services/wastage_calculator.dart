class WastageCalculator {
  static int moneyWasted(String lastSeen, int moneyWasted) {
    DateTime before = DateTime.parse(lastSeen);
    DateTime now = DateTime.now().toUtc();
    int days = now.difference(before).inDays;

    return days * moneyWasted;
  }

  static int timeWasted(String lastSeen, int timeWasted) {
    DateTime before = DateTime.parse(lastSeen);
    DateTime now = DateTime.now().toUtc();
    int days = now.difference(before).inDays;
    return days * timeWasted;
  }
}
