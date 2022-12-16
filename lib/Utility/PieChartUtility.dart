import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Map<String, double> dataMap = {
  "Open": 200,
  "Accepted": 120,
  "Resolved": 30,
  "Partial Resolved": 105,
  "Rejected": 100,
};


final colorList = <Color>[
  Colors.cyanAccent.shade200,
  Colors.yellow.shade300,
  Colors.greenAccent,
  Colors.deepPurpleAccent.shade100,
  Colors.red

];

Map<String, String> dataMap1 = {
  "Open":"  Open                                                 36%",
  "Accepted" :" Accepted                                          22%",
  "Resolved":  "  Resolved                                            5%",
  "Partial Resolved":"  Partial Resolved                               15%",
  "Rejected":   " Rejected                                             18%",
};


List<PieChartSectionData> showingSections() {
  return List.generate(5, (i) {


    switch (i) {
      case 0:
        return PieChartSectionData(

          color: const Color(0xFF81D4FA),
          value: 40,
          title: '40%',
          radius:40,
          titleStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        );
      case 1:
        return PieChartSectionData(
          color: const Color(0xFFFBC02D),
          value: 30,
          title: '15%',
          radius: 40,
          titleStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        );
      case 2:
        return PieChartSectionData(
          color: const Color(0xFFB388FF),
          value: 30,
          title: '15%',
          radius: 40,
          titleStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        );
      case 3:
        return PieChartSectionData(
          color: const Color(0xFFAED581),
          value: 35,
          title: '20%',
          radius: 40,
          titleStyle: TextStyle(
            fontSize:15,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        );
      case 4:
        return PieChartSectionData(
          color: Colors.red.shade400,
          value: 10,
          title: '10%',
          radius: 40,
          titleStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        );
      default:
        throw Error();
    }
  });
}
