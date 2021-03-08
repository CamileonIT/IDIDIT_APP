import 'package:flutter/material.dart';
import 'package:recovery/ui/screens/app.dart';
import 'package:recovery/ui/screens/notification.dart';
import 'package:recovery/ui/screens/settings.dart';
import 'package:recovery/ui/widgets/confession/add_data.dart';
import 'package:recovery/ui/widgets/home/commited.dart';
import 'package:recovery/ui/widgets/sorryy/reset_data.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => App());
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => Settings(),
        );
      case '/notifications':
        return MaterialPageRoute(
          builder: (_) => NotificationView(),
        );
      case '/commited':
        return MaterialPageRoute(
          builder: (_) => AddData(),
        );
      case '/reset':
        return MaterialPageRoute(
          builder: (_) => ResetData(),
        );
      default:
        // If there is no such named route in the switch statement,
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
