import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/features/admin/ui/widgets/pie_chart.dart';

import '../../../member/home/ui/widgets/line_chart.dart';

class AnalyticsBody extends StatelessWidget {
  const AnalyticsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: AppDecorations.containerDecoration,
          child: LineChartWidget(
            spots: const [
              FlSpot(1, 2),
              FlSpot(2, 4),
              FlSpot(3, 3),
              FlSpot(4, 5),
            ],
            minX: 1,
            maxX: 4,
            minY: 0,
            maxY: 6,
            bottomTitles: {1: 'Sat', 2: 'Sun', 3: 'Mon', 4: 'Tue'},
          ),
        ),
        vGap(10),
        Container(
            decoration: AppDecorations.containerDecoration,
            child: PieChartWidget())
      ],
    );
  }
}
