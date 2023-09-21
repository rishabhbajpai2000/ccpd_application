import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ccpd_application/View/JobPosting.dart';
import 'package:flutter/material.dart';

import 'Dashboard/Dashboard.dart';
import 'ProfilePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;
  final iconList = <IconData>[
    Icons.home_outlined,
    Icons.person_outline,
  ];

  List<Widget> pagesList = <Widget>[
    Dashboard(),
    ProfilePage(),
    JobPosting(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          backgroundColor: Color(0xff8E97FD),
          onPressed: () {
            setState(() {
              _bottomNavIndex = 2;
            });
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          height: 70,
          notchMargin: 10,
          splashColor: Color(0xff8E97FD),
          activeColor: Color(0xff8E97FD),
          icons: iconList,
          iconSize: 30,
          elevation: 0,
          blurEffect: true,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) => setState(() {
            _bottomNavIndex = index;
          }),
        ),
        body: pagesList[_bottomNavIndex],
      ),
    );
  }
}
