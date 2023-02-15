import 'package:flutter/material.dart';
import 'package:healthiq/views/homescreen.dart';
import 'package:healthiq/views/login_view.dart';
import 'package:healthiq/views/pie_char.dart';
import 'package:healthiq/views/profilescreen.dart';
import 'package:healthiq/views/schedulescreen.dart';
import 'package:ionicons/ionicons.dart';
import 'package:healthiq/constants/routes.dart';

class Navigation extends StatefulWidget {
  Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  List pages = [
    HomeScreen(),
    ProfileScreen(),
    ScheduleScreen(),
    Home(),
  ];
  int currentIndex = 0;

  void OnTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        backgroundColor: Colors.white,
        onTap: OnTap,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            activeIcon: Icon(Ionicons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            activeIcon: Icon(Ionicons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.chatbubble_ellipses_outline),
            label: "Schedule",
            activeIcon: Icon(Ionicons.calendar_sharp),
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.stats_chart_outline),
            activeIcon: Icon(Ionicons.stats_chart),
            label: "Stats",
          ),
        ],
      ),
    );
  }
}
