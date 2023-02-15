import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthiq/constants/routes.dart';
import 'package:healthiq/views/my_form.dart';
import 'package:healthiq/const.dart';
import 'package:healthiq/views/nav_bar.dart';
import 'package:healthiq/views/profilescreen.dart';
import 'package:healthiq/views/schedulescreen.dart';
import 'package:healthiq/widgets/health_needs.dart';
import 'package:healthiq/widgets/nearby_doctors.dart';
import 'package:healthiq/widgets/upcoming_card.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pages = [
    HomeScreen(),
    ProfileScreen(),
    ScheduleScreen(),
    MyForm(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Pushkaraj",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(suggestionroute, (route) => false);
            },
            icon: const Icon(Ionicons.notifications_outline),
          ),
          IconButton(
            onPressed: () async {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(myformroute, (route) => false);
            },
            icon: const Icon(Ionicons.search_outline),
          ),
          IconButton(
            onPressed: () async {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(myformroute, (route) => false);
            },
            icon: const Icon(Ionicons.keypad_outline),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          const UpcomingCard(),
          const SizedBox(height: 20),
          Text(
            "Health Needs",
            style: GoogleFonts.poppins(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 15),
          const HealthNeeds(),
          const SizedBox(height: 25),
          Text(
            "Doctor Availability",
            style: GoogleFonts.poppins(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 15),
          const NearbyDoctors(),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
