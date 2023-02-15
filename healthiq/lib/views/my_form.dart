import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthiq/const.dart';
import 'package:healthiq/constants/routes.dart';
import 'package:healthiq/views/nav_bar.dart';

class MyForm extends StatefulWidget {
  MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Navigation()));
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const Spacer(),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Your Name",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 14,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SvgPicture.asset("assets/user.svg"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Date of Surgery",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SvgPicture.asset("assets/date.svg"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Name of Doctor",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SvgPicture.asset("assets/user.svg"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Type of Surgery",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SvgPicture.asset("assets/medicine.svg"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Name of Hospital",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SvgPicture.asset("assets/hospital.svg"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Any Previous Record Of Surgery",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              )),

              Spacer(flex: 2),
              //thankyou
              OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "This data will be used for further use in app",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                    ),
                  )),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: Text(
                    "Get Started",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Navigation()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
