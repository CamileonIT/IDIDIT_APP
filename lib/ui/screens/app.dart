import 'package:flutter/material.dart';
import 'app/achievements.dart';
import 'app/confession.dart';
import 'app/home.dart';
import 'app/sorryy.dart';
import 'package:recovery/ui/screens/settings.dart';
import 'package:recovery/ui/utils/util.dart';
import 'package:recovery/ui/utils/globals.dart' as globals;

import 'notification.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int index = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: ClipOval(
          child: Container(
            color: index == 0 ? PaypalColors.LightBlue : PaypalColors.Grey,
            child: Image.asset(
              "assets/images/home.png",
              fit: BoxFit.scaleDown,
              width: 35.0,
              height: 35.0,
            ),
          ),
        ),
        title: Text(
          'Home',
          style: TextStyle(fontFamily: "worksans"),
        ),
      ),
      BottomNavigationBarItem(
          icon: ClipOval(
            child: Container(
              color: index == 1 ? PaypalColors.LightBlue : PaypalColors.Grey,
              child: Image.asset(
                "assets/images/confession.png",
                fit: BoxFit.scaleDown,
                width: 35.0,
                height: 35.0,
              ),
            ),
          ),
          title: Text(
            'Confession',
            style: TextStyle(fontFamily: "worksans"),
          )),
      BottomNavigationBarItem(
        icon: ClipOval(
          child: Container(
            color: index == 2 ? Colors.redAccent : PaypalColors.Grey,
            child: Image.asset(
              "assets/images/sorryy.png",
              fit: BoxFit.scaleDown,
              width: 35.0,
              height: 35.0,
            ),
          ),
        ),
        title: Text(
          'Sorryy',
          style: TextStyle(
              fontFamily: "worksans",
              color: index == 2 ? Colors.redAccent : PaypalColors.Grey),
        ),
      ),
      BottomNavigationBarItem(
        icon: ClipOval(
          child: Container(
            color: index == 3 ? PaypalColors.LightBlue : PaypalColors.Grey,
            child: Image.asset(
              "assets/images/Achievements.png",
              fit: BoxFit.fitHeight,
              width: 35.0,
              height: 35.0,
            ),
          ),
        ),
        title: Text(
          'Achievements',
          style: TextStyle(fontFamily: "worksans"),
        ),
      ),
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        Home(),
        Confession(),
        Sorryy(),
        Achievements(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      this.index = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      this.index = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Scaffold(
          backgroundColor: Colors.white,
          appBar: _mainAppBar(context),
          body: buildPageView(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (int index) {
              bottomTapped(index);
            },
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            elevation: 9,
            items: buildBottomNavBarItems(),
          ),
        ),
      ],
    );
  }
}

AppBar _mainAppBar(context) {
  return AppBar(
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
      GestureDetector(
        onTap: () {},
        child: Stack(
          children: <Widget>[
            new IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.blue,
                ),
                onPressed: () {
                  globals.notification = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationView()),
                  );
                }),
            globals.notification
                ? new Positioned(
                    right: 11,
                    top: 11,
                    child: new Container(
                      padding: EdgeInsets.all(2),
                      decoration: new BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : new Container()
          ],
        ),
      )
    ],
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
