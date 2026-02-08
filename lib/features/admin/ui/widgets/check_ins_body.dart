import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';

import '../../../../core/helpers/app_decoration.dart';
import '../../../../core/widgets/column_chart.dart';

class CheckInsBody extends StatelessWidget {
  const CheckInsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(

          decoration: AppDecorations.containerDecoration,
          margin: EdgeInsets.all(10),
          child: ColumnChartWidget(
            minY: 0,
            maxY: 100, 
            bottomTitles: {
              0: '6 AM',
              1: '8 AM',
              2: '10 AM',
              3: '12 PM',
              4: '2 PM',
              5: '4 PM',
              6: '6 PM',
              7: '8 PM',
            },
            barGroups: [
              BarChartGroupData(
                x: 0,
                barRods: [
                  BarChartRodData(
                    toY: 40,
                    width: 18,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 1,
                barRods: [
                  BarChartRodData(
                    toY: 55,
                    width: 18,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 2,
                barRods: [
                  BarChartRodData(
                    toY: 70,
                    width: 18,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 3,
                barRods: [
                  BarChartRodData(
                    toY: 50,
                    width: 18,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 4,
                barRods: [
                  BarChartRodData(
                    toY: 30,
                    width: 18,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 5,
                barRods: [
                  BarChartRodData(
                    toY: 60,
                    width: 18,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 6,
                barRods: [
                  BarChartRodData(
                    toY: 80,
                    width: 18,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ],
              ),
              BarChartGroupData(
                x: 7,
                barRods: [
                  BarChartRodData(
                    toY: 45,
                    width: 18,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: AppDecorations.containerDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Live status', style: AppTextStyles.font16WhiteBold),
              vGap(10),
              Center(child: Text('147', style: AppTextStyles.font16WhiteBold.copyWith(fontSize: 24.sp),),),
              vGap(5),
              Center(child: Text('Members Currently Inside', style: AppTextStyles.font14GreyRegular,),),
              vGap(10),
              Text('82 Members', style: TextStyle(color: Colors.white)),
              vGap(10),
              LinearProgressIndicator(
                borderRadius: BorderRadius.circular(14),
                value: 82 / 147,
                backgroundColor: Colors.grey[800],
                color: AppColors.grey,
                minHeight: 20,
              ),
              vGap(10),
              Text('64 Members', style: TextStyle(color: Colors.white)),
              vGap(10),
              LinearProgressIndicator(
                borderRadius: BorderRadius.circular(14),
                value: 64 / 147,
                backgroundColor: Colors.grey[800],
                color: AppColors.grey,
                minHeight: 20,
              ),

            ],
          ),
        ),
      ],
    );
  }
}
