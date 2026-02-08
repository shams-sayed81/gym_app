import 'package:flutter/material.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';
import 'package:gym_app/core/helpers/helpers.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';

class CoachContainer extends StatelessWidget {
  const CoachContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.containerDecoration,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFF190F03),
            child: Text(
              Helpers.getInitials('Sarah Connor'),
              style: AppTextStyles.font16WhiteBold,
            ),
          ),
          vGap(5),
          Text('Sarah Connor', style: AppTextStyles.font16WhiteBold),
          Text('Head Coach', style: AppTextStyles.font14GreyRegular),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.all(5),

                decoration: AppDecorations.containerDecoration.copyWith(
                  color: AppColors.primary,
                ),
                child: Text('⭐ 4.9' , style: AppTextStyles.font14WhiteRegular,),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: AppDecorations.containerDecoration.copyWith(
                  color: Colors.green.withValues(alpha: 0.3),
                ),
                child: Text('Active' , style: AppTextStyles.font14GreyRegular.copyWith(color: Colors.green),),
              ),
            ],
          ),
          const Divider(color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('15', style: AppTextStyles.font16WhiteBold,),
                    Text('Members', style: AppTextStyles.font14GreyRegular,),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text('20', style: AppTextStyles.font16WhiteBold,),
                    Text('Sessions', style: AppTextStyles.font14GreyRegular,),
                  ],
                ),
              ),
            ],
          ),        ],
      ),
    );
  }
}
