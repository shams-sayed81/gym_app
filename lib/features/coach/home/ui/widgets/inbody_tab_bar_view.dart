import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_feild.dart';
import '../../../../../generated/l10n.dart';

class InBodyTabBarView extends StatelessWidget {
  const InBodyTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(s.history, style: AppTextStyles.font14GreyRegular),
        vGap(10),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => Container(
              decoration: AppDecorations.containerDecoration,
              padding: EdgeInsets.all(10),
              child: ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('data', style: AppTextStyles.font14GreyRegular.copyWith(fontSize: 12),),
                    hGap(5),
                    Text('data', style: AppTextStyles.font14GreyRegular.copyWith(fontSize: 12),),
                    hGap(5),
                    Text('data', style: AppTextStyles.font14GreyRegular.copyWith(fontSize: 12),),
                  ],
                ),
                title: Text('data', style: AppTextStyles.font16WhiteRegular),
              ),
            ),
            separatorBuilder: (context, index) => vGap(10),
            itemCount: 4,
          ),
        ),
        Text(s.coach_comments, style: AppTextStyles.font16WhiteBold),
        vGap(5),
        CustomTextFormField(textInputType: TextInputType.text, maxLines: 3),
        vGap(10),
        CustomButton(
          color: AppColors.secondary,
          width: 100.w,
          text: s.save_comments,
          onPressed: () {},
        ),
      ],
    );
  }
}
