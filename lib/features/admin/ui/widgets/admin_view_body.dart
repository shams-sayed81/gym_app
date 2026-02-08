import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';

import '../../../../core/widgets/column_chart.dart';
import '../../../member/home/ui/widgets/line_chart.dart';

class AdminViewBody extends StatelessWidget {
  const AdminViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Stats cards
          SizedBox(
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (_, i) => const _StatCard(color: Colors.purple),
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemCount: 6,
            ),
          ),

          const SizedBox(height: 16),

          /// Revenue Chart
          const SizedBox(height: 16),

          /// Quick Actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  'Quick Actions',
                  style: AppTextStyles.font16WhiteBold,
                ),
                vGap(10),
                _QuickActionsGrid(),
              ],
            ),
          ),
           vGap(10),
          Container(
            decoration: AppDecorations.containerDecoration,
            margin: EdgeInsets.all(10),
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
          vGap(15),
          Container(
            decoration: AppDecorations.containerDecoration,
            margin: EdgeInsets.all(10),
            child: ColumnChartWidget(
              minY: 0,
              maxY: 100,
              bottomTitles: {
                0: 'Sat',
                1: 'Sun',
                2: 'Mon',
                3: 'Tue',
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
                      toY: 70,
                      width: 18,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// Top Products
          _Card(),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final Color color;
  const _StatCard({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '812',
            style: AppTextStyles.font16WhiteBold.copyWith(color: color),
          ),
          vGap(5),
          Text('Total Members', style: AppTextStyles.font14GreyRegular),
          vGap(5),
          Text(
            '+12 this week',
            style: AppTextStyles.font14GreyRegular.copyWith(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}

class _QuickActionsGrid extends StatelessWidget {
  const _QuickActionsGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: [
        _QuickAction(
          title: 'Add Member',
          icon: Icons.person_add,
          color: Colors.blueAccent,
        ),
        _QuickAction(
          title: 'New Plan',
          icon: Icons.credit_card,
          color: Colors.purple,
        ),
        _QuickAction(
          title: 'Add Product',
          icon: Icons.indeterminate_check_box_outlined,
          color: AppColors.emerald,
        ),
        _QuickAction(
          title: 'Announce',
          icon: Icons.notifications_none,
          color: Colors.deepOrangeAccent,
        ),
      ],
    );
  }
}

class _QuickAction extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _QuickAction({
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: AppDecorations.containerDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 35.sp, color: color),
            vGap(10),
            Text(title, style: AppTextStyles.font14GreyRegular),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {

  const _Card();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.all(10),
      decoration: AppDecorations.containerDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top Products', style: AppTextStyles.font16WhiteBold),
          vGap(10),
          ListTile(
            title: Text('Whey Protein Isolate', style: AppTextStyles.font14GreyRegular),
            trailing: Container(
                padding: EdgeInsets.all(5),
                decoration: AppDecorations.containerDecoration.copyWith(color: AppColors.primary),
                child: Text('85 sold', style: AppTextStyles.font14WhiteRegular,)),
          ),
          ListTile(
            title: Text('Pre-Workout Ignite', style: AppTextStyles.font14GreyRegular,),
            trailing: Container(
              padding: EdgeInsets.all(5),
                decoration: AppDecorations.containerDecoration.copyWith(color: AppColors.primary),
              child: Text('85 sold', style: AppTextStyles.font14WhiteRegular,)),
          ),
          ListTile(
            title: Text('Creatine Monohydrate', style: AppTextStyles.font14GreyRegular),
            trailing: Container(
                padding: EdgeInsets.all(5),
                decoration: AppDecorations.containerDecoration.copyWith(color: AppColors.primary),
                child: Text('85 sold', style: AppTextStyles.font14WhiteRegular,)),
          ),
        ],
      ),
    );
  }
}
