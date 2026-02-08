import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 82,
              color: Colors.green,
              title: '82',
              radius: 50,
              titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),

            PieChartSectionData(
              value: 82,
              color: Colors.purple,
              title: '82',
              radius: 50,
              titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            PieChartSectionData(
              value: 82,
              color: Colors.grey,
              title: '82',
              radius: 50,
              titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            PieChartSectionData(
              value: 65,
              color: Colors.blue,
              title: '65',
              radius: 50,
              titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
          sectionsSpace: 4,
          centerSpaceRadius: 30,
        ),
      ),
    );
  }
}