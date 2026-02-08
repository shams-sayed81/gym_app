import 'package:flutter/material.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';

import '../../../../member/data/models/member_model.dart';

class OverviewTabBarView extends StatelessWidget {
  final MemberModel member;

  const OverviewTabBarView({super.key ,required this.member});

  @override
  Widget build(BuildContext context) {
    final List<String> list =['fat loss' , 'strength' ,'injury'];
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(

              leading: CircleAvatar(

                backgroundColor: AppColors.secondary,
                child: Text(getInitials(member.name ??''), style: AppTextStyles.font14WhiteRegular,),

              ),
              title: Text(member.name??'' , style: AppTextStyles.font16WhiteBold,),
              subtitle:  Column(
                children: [
                  Row(
                    children: [
                      Text(member.age.toString() , style: AppTextStyles.font14WhiteRegular,),
                      hGap(10),
                      Text('Male' , style: AppTextStyles.font14WhiteRegular,),
                      hGap(10),
                      Text('Intermediate', style: AppTextStyles.font14WhiteRegular,)
                    ],
                  ),
                  Row(
                    children: list.map((e) => Container(
                      decoration: AppDecorations.containerDecoration,
                      padding: EdgeInsets.all(10),
                      child: Text(e, style: AppTextStyles.font14WhiteRegular,),
                    ),).toList()
                  ),
                ],
              ),
            ),

          ],
        ),

    );
  }
  String getInitials(String fullName) {
    if (fullName.trim().isEmpty) return '';
    final parts = fullName.trim().split(' ');
    if (parts.length >= 2) {
      return parts[0][0] + parts[1][0];
    }
    return fullName[0];
  }

  Widget buildContainer({required String title , required String subtitle , required String duration}){
    return Container(
      decoration: AppDecorations.containerDecoration,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            trailing: TextButton(onPressed: () {
            }, child: Text('Edit' , style: AppTextStyles.font14WhiteRegular,)),
            title: Text('data'),
          ),
          ListTile(),
        ],
      ),
    );
  }

}
