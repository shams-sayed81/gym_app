
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../core/theme/app_colors.dart';


import '../../../ai/ai_tab.dart';
import '../../../eat/widgets/eat_tap.dart';
import '../../../shop/ui/widgets/market_tab.dart';
import '../../../train/widgets/train_tap.dart';
import '../../manager/bottom_nav_bar_cubit.dart';
import '../widgets/bottom_nav_bar_view_body.dart';
import '../widgets/home_tab.dart';




class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});
  static const String routeName = '/nav';

  @override
  State<BottomNavBarView> createState() => BottomNavBarViewState();
}

class BottomNavBarViewState extends State<BottomNavBarView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> homeBodies = [
      HomeTab(),
      TrainTab(),
      AiTab(),
      EatTab(),
      MarketTab(),
    ];

    return BlocProvider(
      create: (_) => BottomNavBarCubit(),
      child: SafeArea(
        child: GestureDetector(
          onTap: () =>FocusScope.of(context).unfocus(),
          child: Scaffold(

            backgroundColor: AppColors.primary,
            extendBody: false,
            body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
              builder: (context, state) {
                final cubit = context.read<BottomNavBarCubit>();
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: homeBodies[cubit.currentIndex],
                );
              },
            ),
            bottomNavigationBar: BottomNavBarViewBody(),
          ),
        ),
      ),
    );
  }
}
