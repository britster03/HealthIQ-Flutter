// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:healthiq/constants/routes.dart';
import 'package:healthiq/const.dart';

class HealthNeeds extends StatelessWidget {
  const HealthNeeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CustomIcon> customIcons = [
      CustomIcon(
          name: "Appointment",
          icon: 'assets/appointment.png',
          onPressed: () {}),
      CustomIcon(
          name: "Hospital",
          icon: 'assets/hospital.png',
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(myformroute, (route) => false);
          }),
      CustomIcon(name: "Covid-19", icon: 'assets/virus.png', onPressed: () {}),
      CustomIcon(name: "More", icon: 'assets/more.png', onPressed: () {}),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(customIcons.length, (index) {
        return Column(
          children: [
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                customIcons[index].icon,
              ),
            ),
            const SizedBox(height: 6),
            Text(customIcons[index].name)
          ],
        );
      }),
    );
  }
}

class CustomIcon {
  final String name;
  final String icon;
  CustomIcon({
    required this.name,
    required this.icon,
    required Null Function() onPressed,
  });
}
