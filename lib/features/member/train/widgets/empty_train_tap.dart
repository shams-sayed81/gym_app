import 'package:flutter/material.dart';

import '../../../../core/helpers/app_decoration.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../generated/l10n.dart';



class EmptyTrainTap extends StatelessWidget {
  const EmptyTrainTap({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: AppDecorations.containerDecoration.copyWith(
              borderRadius: BorderRadius.circular(50)
          ),
          child: Icon(Icons.calendar_month, color: AppColors.babyBlue),
        ),
        vGap(10),
        Text(s.no_active_plan, style: AppTextStyles.font16WhiteBold),
        vGap(10),
        Text(
          s.no_training_plan_yet,
          style: AppTextStyles.font14GreyRegular,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
