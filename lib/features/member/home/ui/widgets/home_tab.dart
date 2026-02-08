import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/features/member/home/ui/widgets/plan_dilog.dart';
import 'package:intl/intl.dart';

import 'package:gym_app/core/widgets/custom_button.dart';
import 'package:gym_app/features/member/home/ui/widgets/water_dialog.dart';
import 'package:gym_app/features/member/home/ui/widgets/workout_dialog.dart';
import '../../../../../core/helpers/app_decoration.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/member_cubit.dart';
import '../../manager/member_state.dart';
import 'column_chart.dart';
import 'food_dialog.dart';
import 'nutrition_progress_container.dart';
import 'sleep_dialog.dart';
import 'weight_dialog.dart';
import 'workout_card.dart';
import '../../../profile/ui/widgets/profile_tab.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  PageController? pageController;

  @override
  void initState() {
    super.initState();
    _initWorkout();
  }

  Future<void> _initWorkout() async {
    final cubit = context.read<MemberCubit>();
    await cubit.restoreWorkout();

    pageController = PageController(
      initialPage:
      cubit.currentExercise.clamp(0, cubit.totalExercises - 1),
    );

    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return BlocBuilder<MemberCubit, MemberState>(
      builder: (context, state) {
        double weight = 0;
        double sleepHrs = 0;
        double waterL = 0;

        if (state is MemberLoaded) {
          weight = state.member.weight ?? 0;
          sleepHrs = state.member.sleepHrs ?? 0;
          waterL = state.member.waterL ?? 0;
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                toolbarHeight: 100,
                backgroundColor: AppColors.primary,
                title: ListTile(
                  title: Text(
                    DateFormat('EEEE, MMM d').format(DateTime.now()),
                    style: AppTextStyles.font14GreyRegular,
                  ),
                  subtitle: Text(
                    'Hello, ${state is MemberLoaded ? state.member.name : ""}',
                    style: AppTextStyles.font16WhiteBold,
                  ),
                ),
                actions: [
                  _iconButton(Icons.qr_code_2, () {}),
                  hGap(10),
                  _iconButton(
                    Icons.person_outline,
                        () => context.push(ProfileScreen.routeName),
                  ),
                  hGap(10),
                  _iconButton(Icons.notifications_none, () {}),
                ],
              ),
              vGap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(s.todays_workout,
                      style: AppTextStyles.font16WhiteBold),
                  TextButton(
                    onPressed: () => showPlanDialog(context),
                    child: Text(
                      s.view_plan,
                      style: AppTextStyles.font16WhiteBold.copyWith(
                        color: AppColors.emerald,
                      ),
                    ),
                  ),
                ],
              ),
              vGap(10),
              WorkoutCard(
                title: 'Upper Body Power',
                subtitle: 'Chest, Shoulders & Triceps',
                duration: '45 min',
                calories: '320 kcal',
                exercisesCount: '8 Exercises',
                onStart: () async {
                  final cubit = context.read<MemberCubit>();
                  await cubit.restoreWorkout();

                  if (pageController != null) {
                    showWorkoutDialog(
                      context,
                      pageController: pageController!,
                    );
                  }
                },
              ),
              vGap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(s.nutrition,
                      style: AppTextStyles.font16WhiteBold),
                  CustomButton(
                    text: s.log_meal,
                    onPressed: () => showFoodDialog(context),
                    iconData: Icons.add,
                    iconBeforeText: true,
                    width: 150,
                  ),
                ],
              ),
              vGap(10),
              Row(
                children: [
                  Expanded(
                    child: NutritionProgressContainer(
                      title: s.calories,
                      value: 1240,
                      target: 2400,
                      icon: Icon(
                        Icons.local_fire_department_outlined,
                        color: AppColors.red,
                      ),
                    ),
                  ),
                  Expanded(
                    child: NutritionProgressContainer(
                      title: s.protein,
                      value: 110,
                      target: 180,
                      icon: Icon(
                        Icons.circle_outlined,
                        color: AppColors.blue,
                      ),
                    ),
                  ),
                ],
              ),
              vGap(15),
              Text(s.activity,
                  style: AppTextStyles.font16WhiteBold),
              vGap(10),
              Container(
                height: 200.h,
                decoration: AppDecorations.containerDecoration,
                child: WeeklyColumnChart(
                  values: [30, 50, 20, 80, 60, 40, 70],
                  maxY: 100,
                  barColor: AppColors.teal,
                ),
              ),
              vGap(15),
              Row(
                children: [
                  _buildListTile(
                    onTap: () => showWeightDialog(context),
                    value: weight,
                    subtitle: s.weight_kg,
                    color: AppColors.teal,
                  ),
                  hGap(5),
                  _buildListTile(
                    onTap: () => showSleepDialog(context),
                    value: sleepHrs,
                    subtitle: s.sleep_hrs,
                    color: AppColors.blue,
                  ),
                  hGap(5),
                  _buildListTile(
                    onTap: () => showWaterDialog(context),
                    value: waterL,
                    subtitle: s.water_l,
                    color: AppColors.purple,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListTile({
    required void Function()? onTap,
    required String subtitle,
    required double value,
    required Color color,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: AppDecorations.containerDecoration,
          padding: const EdgeInsets.all(10),
          height: 100,
          child: ListTile(
            title: Text(
              value.toStringAsFixed(1),
              style: AppTextStyles.font16WhiteBold.copyWith(color: color),
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              subtitle.toUpperCase(),
              style: AppTextStyles.font14GreyRegular,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, void Function()? onPressed) {
    return Container(
      decoration: AppDecorations.containerDecoration.copyWith(
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.grey),
      ),
    );
  }
}