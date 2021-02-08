class AchievementCalculator {
  static String lastAchievement(String lastSeen) {
    DateTime before = DateTime.parse(lastSeen);
    DateTime now = DateTime.now().toUtc();
    int days = now.difference(before).inDays;
    if (days < 1) {
      return "Made the Decision";
    } else if (days < 3) {
      return "24 Hours";
    } else if (days < 7) {
      return "3 Days";
    } else if (days < 10) {
      return "1 Week";
    } else if (days < 14) {
      return "10 Days";
    } else if (days < 30) {
      return "2 Weeks";
    } else if (days < 91) {
      return "1 Month";
    } else if (days < 180) {
      return "3 Months";
    } else if (days < 365) {
      return "6 Months";
    } else if (days < 730) {
      return "1 Year";
    } else {
      return "2 Years";
    }
  }

  static String nextAchievement(String lastSeen) {
    DateTime before = DateTime.parse(lastSeen);
    DateTime now = DateTime.now().toUtc();
    int days = now.difference(before).inDays;
    if (days < 1) {
      return "24 Hours";
    } else if (days < 3) {
      return "3 Days";
    } else if (days < 7) {
      return "1 Week";
    } else if (days < 10) {
      return "10 Days";
    } else if (days < 14) {
      return "2 Weeks";
    } else if (days < 30) {
      return "1 Month";
    } else if (days < 91) {
      return "3 Months";
    } else if (days < 180) {
      return "6 Months";
    } else if (days < 365) {
      return "1 Year";
    } else if (days < 730) {
      return "2 Years";
    } else {
      return "5 Years";
    }
  }

  static double percentageAchievement(String lastSeen) {
    DateTime before = DateTime.parse(lastSeen);
    DateTime now = DateTime.now().toUtc();
    int days = now.difference(before).inDays;
    int minutes = now.difference(before).inMinutes;
    if (days < 1) {
      return (minutes * 100 / 1440);
    } else if (days < 3) {
      return (minutes * 100 / 4320);
    } else if (days < 7) {
      return (minutes * 100 / 10080);
    } else if (days < 10) {
      return (minutes * 100 / 14400);
    } else if (days < 14) {
      return (minutes * 100 / 20160);
    } else if (days < 30) {
      return (minutes * 100 / 43200);
    } else if (days < 91) {
      return (minutes * 100 / 131040);
    } else if (days < 180) {
      return (minutes * 100 / 259200);
    } else if (days < 365) {
      return (minutes * 100 / 525600);
    } else if (days < 730) {
      return (minutes * 100 / 1051200);
    } else {
      return (minutes * 100 / 2628000);
    }
  }

  static String lastSeenFormatted(String lastSeen) {
    return lastSeen;
  }
}
