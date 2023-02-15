import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthiq/constants/routes.dart';
import 'package:pie_chart/pie_chart.dart';

class Home extends StatelessWidget {
  Map<String, double> dataMap = {
    "Nutrients": 5,
    "Vitamins": 5,
    "Carbs": 5,
    "Fats": 1,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personalised Diet Requirement Chart",
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
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            //DecorationImage
            border: Border.all(
              color: Colors.grey.shade300,
              width: 8,
            ), //Border.all
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: const Offset(
                  5.0,
                  5.0,
                ), //Offset
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ), //B
          child: Center(
            child: PieChart(
              dataMap: dataMap,
              chartRadius: MediaQuery.of(context).size.width / 1.7,
              legendOptions: LegendOptions(
                legendPosition: LegendPosition.bottom,
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValuesInPercentage: true,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
