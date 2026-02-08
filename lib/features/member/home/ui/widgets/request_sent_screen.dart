import 'package:flutter/material.dart';
import 'package:gym_app/core/theme/app_colors.dart';

class RequestSentScreen extends StatelessWidget {
  const RequestSentScreen({super.key});
  static const String routeName='/request-sent';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

        ],
      ),
    );
  }
}
