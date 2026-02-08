import 'package:flutter/material.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:gym_app/core/widgets/custom_tab_bar.dart';
import 'package:gym_app/features/coach/home/ui/widgets/overview_tab_bar_view.dart';

import '../../../../../generated/l10n.dart';
import '../../../../member/data/models/member_model.dart';

class MemberProfileScreen extends StatelessWidget {
  final MemberModel member;

  const MemberProfileScreen({super.key, required this.member});
  static const String routeName = '/member-profile';

  @override
  Widget build(BuildContext context) {
    final s=S.of(context);
    return Scaffold(

      appBar: AppBar(

        iconTheme: IconThemeData(color: AppColors.white , ),
        backgroundColor: AppColors.primary,
      title: Text(s.member_profile , style: AppTextStyles.font14WhiteRegular,),
      ),
      backgroundColor: AppColors.primary,
      body: DefaultTabController(
        length: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTabBar(
              isScrollable: true,

              tabs: [
              Tab(text: s.overview,),
              Tab(text: s.training,),
              Tab(text: s.nutrition,),
              Tab(text: s.inbody,),
              Tab(text: s.messages,),
            ],),

            Expanded(
              child: TabBarView(
                children: [
              OverviewTabBarView(member: member),
              OverviewTabBarView(member: member),
              OverviewTabBarView(member: member),
              OverviewTabBarView(member: member),
              OverviewTabBarView(member: member),

            ],
            ),
            ),
          ],

        ),
      ),
    );
  }
}
