import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/features/auth/ui/views/login_view.dart';
import 'package:gym_app/features/auth/ui/views/sign_up_view.dart';
import 'package:gym_app/features/auth/ui/views/survey_view.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_feild.dart';
import '../../../../generated/l10n.dart';

class MemberTabBarView extends StatelessWidget {
  final bool isCoach;
  final bool isSignUp;
  const MemberTabBarView({
    super.key,
    this.isCoach = false,
    this.isSignUp = false,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Text(s.email_or_phone, style: AppTextStyles.font16WhiteBold),
        ),
        vGap(10),
        CustomTextFormField(
          hintText: 'hello@example.com',
          textInputType: TextInputType.emailAddress,
        ),
        vGap(15),
        Align(
          alignment: AlignmentDirectional.bottomStart,
          child: Text(s.password, style: AppTextStyles.font16WhiteBold),
        ),
        vGap(10),
        CustomTextFormField(
          textInputType: TextInputType.visiblePassword,
          hintText: '••••••••',
        ),

        if(isSignUp) ...[
          vGap(15),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Text(s.phone_optional, style: AppTextStyles.font16WhiteBold),
          ),
          vGap(10),
          CustomTextFormField(
            textInputType: TextInputType.phone,
            hintText: '+1 (555) 000-0000',
          ),
        ],
        vGap(15),
        CustomButton(
          text: isSignUp ? s.sign_up : s.login,
          onPressed: () => context.go(OnboardingView.routeName),
          iconData: Icons.arrow_forward,
          color: isCoach ? AppColors.blue : AppColors.emerald,
        ),
        vGap(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isSignUp ? s.already_have_account : s.no_account,
              style: AppTextStyles.font14GreyRegular,
            ),
            TextButton(
              onPressed: () => isSignUp
                  ? context.go(LoginView.routeName)
                  : context.go(SignUpView.routeName),
              child: Text(
                isSignUp ? s.login : s.sign_up,
                style: AppTextStyles.font14GreyRegular,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
