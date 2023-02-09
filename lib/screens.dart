// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home page/home.dart';
import 'my stats.dart';
import 'notifcatoin.dart';

class Screens extends StatefulWidget {
  const Screens({Key? key}) : super(key: key);

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int counter = 0;
  int current = 0;

  final screens = [
    const Home(),
    const Mystats(),
    const notifcation(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: screens[current],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: current,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (index) => setState(() => current = index),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  size: 32,
                ),
                label: 'Home',
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.stacked_line_chart,
                size: 32,
              ),
              label: 'My Stocks',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 32,
              ),
              label: 'Notification',
            ),
          ],
        ),
      ),
    );
  }
}
