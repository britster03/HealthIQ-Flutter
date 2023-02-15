// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthiq/constants/routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "healthIQ",
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () async {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(homescreenroute, (route) => false);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // COLUMN THAT WILL CONTAIN THE PROFILE
          Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Lily Dsouza",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                "Junior Product Designer",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                ),
              )
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Text(
                  "Stages of therapy completed",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                  ),
                ),
              ),
              Text(
                "(1/5)",
                style: TextStyle(
                  color: Colors.blue,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: List.generate(5, (index) {
              return Expanded(
                child: Container(
                  height: 7,
                  margin: EdgeInsets.only(right: index == 4 ? 3 : 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: index == 0 ? Colors.blue : Colors.black12,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final card = profileCompletionCards[index];
                return SizedBox(
                  width: 160,
                  child: Card(
                    shadowColor: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Icon(
                            card.icon,
                            size: 30,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            card.title,
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Text(card.buttonText),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const Padding(padding: EdgeInsets.only(right: 5)),
              itemCount: profileCompletionCards.length,
            ),
          ),
          const SizedBox(height: 35),
          ...List.generate(
            customListTiles.length,
            (index) {
              final tile = customListTiles[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Card(
                  elevation: 4,
                  shadowColor: Colors.black12,
                  child: ListTile(
                    leading: Icon(tile.icon),
                    title: Text(tile.title),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class ProfileCompletionCard {
  final String title;
  final String buttonText;
  final IconData icon;
  ProfileCompletionCard({
    required this.title,
    required this.buttonText,
    required this.icon,
  });
}

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    title: "Check health reports",
    icon: CupertinoIcons.person_circle,
    buttonText: "Continue",
  ),
  ProfileCompletionCard(
    title: "Upload your prescription",
    icon: CupertinoIcons.doc,
    buttonText: "Upload",
  ),
  ProfileCompletionCard(
    title: "Medical History",
    icon: CupertinoIcons.square_list,
    buttonText: "Add",
  ),
];

class CustomListTile {
  final IconData icon;
  final String title;
  CustomListTile({
    required this.icon,
    required this.title,
    required TextStyle style,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.insights,
    title: "Medical Reports",
    style: GoogleFonts.poppins(
      fontSize: 20,
    ),
  ),
  CustomListTile(
    icon: Icons.location_on_outlined,
    title: "Nearby Hospitals",
    style: GoogleFonts.poppins(
      fontSize: 20,
    ),
  ),
  CustomListTile(
    title: "Notifications",
    icon: CupertinoIcons.bell,
    style: GoogleFonts.poppins(
      fontSize: 20,
    ),
  ),
  CustomListTile(
    title: "Logout",
    style: GoogleFonts.poppins(
      fontSize: 20,
    ),
    icon: CupertinoIcons.arrow_right_arrow_left,
  ),
];
