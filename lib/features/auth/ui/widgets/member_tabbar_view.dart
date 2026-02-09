import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_app/core/enums/login.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/features/admin/ui/views/admin_view.dart';
import 'package:gym_app/features/auth/ui/views/login_view.dart';
import 'package:gym_app/features/auth/ui/views/sign_up_view.dart';
import 'package:gym_app/features/auth/ui/views/survey_view.dart';
import 'package:gym_app/features/coach/home/ui/views/coach_bottom_nav_bar_view.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_feild.dart';
import '../../../../generated/l10n.dart';

class MemberTabBarView extends StatelessWidget {
  final LoginRole role;
  final bool isSignUp;

  const MemberTabBarView({
    super.key,
    required this.role,
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

        if (isSignUp) ...[
          vGap(15),
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Text(s.phone_optional,
                style: AppTextStyles.font16WhiteBold),
          ),
          vGap(10),
          CustomTextFormField(
            textInputType: TextInputType.phone,
            hintText: '+1 (555) 000-0000',
          ),
        ],



        vGap(20),
        CustomButton(
          text: isSignUp ? s.sign_up : s.login,
          onPressed: () => _onSubmit(context),
          iconData: Icons.arrow_forward,
          color: _buttonColor(),
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

  /// 🔹 Button color based on role
  Color _buttonColor() {
    switch (role) {
      case LoginRole.member:
        return AppColors.emerald;
      case LoginRole.coach:
        return AppColors.blue;
      case LoginRole.admin:
        return AppColors.purple;
    }
  }

  void _onSubmit(BuildContext context) {
    switch (role) {
      case LoginRole.member:
        context.go(OnboardingView.routeName);
        break;
      case LoginRole.coach:
        context.go(CoachBottomNavBarView.routeName);
        break;
      case LoginRole.admin:
        context.go(AdminView.routeName);
        break;
    }
  }
}