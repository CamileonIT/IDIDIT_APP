import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recovery/ui/pages/achievements.dart';
import 'package:recovery/ui/pages/sorryy.dart';
import 'package:recovery/ui/utils/util.dart';

import 'detail.screen.dart';
import 'home.dart';

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
        DetailScreen(),
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
          appBar: _mainAppBar(),
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

AppBar _mainAppBar() {
  return AppBar(
    leading: Image.asset(
      'assets/images/icon_settings.png',
      color: PaypalColors.DarkBlue,
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
  );
}
