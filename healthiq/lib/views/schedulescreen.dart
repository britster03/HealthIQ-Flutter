import 'package:google_fonts/google_fonts.dart';
import 'package:healthiq/const.dart';
import 'package:healthiq/models/schedule_model.dart';
import 'package:healthiq/widgets/schedule_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Upcoming', 'Completed', 'Canceled'];
    List<Schedule> nearest = schedules
        .where((element) =>
            DateFormat('d/MM/y').format(element.time) ==
            DateFormat('d/MM/y').format(DateTime.now()))
        .toList();
    List<Schedule> futures = schedules
        .where((element) =>
            DateFormat('d/MM/y').format(element.time) !=
            DateFormat('d/MM/y').format(DateTime.now()))
        .toList();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Schedule',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5)),
                        child: Material(
                          child: TabBar(
                              indicatorColor: Colors.blue,
                              unselectedLabelColor: black.withOpacity(.5),
                              labelStyle: roboto.copyWith(
                                  fontSize: 14, letterSpacing: 1),
                              labelColor: white,
                              indicator: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              tabs: [
                                ...List.generate(
                                    tabs.length,
                                    (index) => Tab(
                                          text: tabs[index],
                                        ))
                              ]),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: TabBarView(children: [
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nearest visit',
                                style: GoogleFonts.poppins(
                                  fontSize: 19,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ...List.generate(
                                  nearest.length,
                                  (index) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 16),
                                        child: ScheduleItem(
                                          schedule: nearest[index],
                                        ),
                                      )),
                              const SizedBox(height: 1),
                              Text(
                                'Future visit',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ...List.generate(
                                  futures.length,
                                  (index) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 16),
                                        child: ScheduleItem(
                                          schedule: futures[index],
                                        ),
                                      )),
                            ],
                          ),
                        ),
                        Center(
                          child: Text(
                            'Completed',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Canceled',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ]),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
