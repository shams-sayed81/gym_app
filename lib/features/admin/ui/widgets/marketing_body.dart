import 'package:flutter/material.dart';
import 'package:gym_app/core/helpers/app_decoration.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:gym_app/core/widgets/custom_button.dart';
import 'package:gym_app/core/widgets/custom_dropdown_menu.dart';
import 'package:gym_app/core/widgets/custom_text_feild.dart';

class MarketingBody extends StatefulWidget {
  const MarketingBody({super.key});

  @override
  State<MarketingBody> createState() => _MarketingBodyState();
}

class _MarketingBodyState extends State<MarketingBody> {
  String? selectedFilter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: AppDecorations.containerDecoration,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Promo Codes', style: AppTextStyles.font16WhiteBold),
              vGap(5),
              Text(
                'Manage discounts and offers',
                style: AppTextStyles.font14GreyRegular,
              ),
              vGap(10),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CustomTextFormField(
                      textInputType: TextInputType.text,
                      hintText: 'Enter Code',
                    ),
                  ),
                  hGap(5),
                  Expanded(
                    flex: 1,
                    child: CustomButton(text: 'Create', onPressed: () {}),
                  ),
                ],
              ),
              ListTile(
                title: Text('Welcome10', style: AppTextStyles.font16WhiteBold),
                subtitle: Text(
                  '10% off',
                  style: AppTextStyles.font14GreyRegular,
                ),
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                  activeThumbColor: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
        vGap(10),
        Container(
          decoration: AppDecorations.containerDecoration,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Push Notifications', style: AppTextStyles.font16WhiteBold),
              vGap(5),
              Text(
                'Manage discounts and offers',
                style: AppTextStyles.font14GreyRegular,
              ),
              vGap(10),
              Text('Audience', style: AppTextStyles.font14WhiteRegular),
              vGap(5),
              CustomDropdown<String>(
                items: const ['All Members', 'Low Activity', 'Expiring Soon'],
                labelBuilder: (e) => e,
                hint: 'Select Filter',
                onChanged: (value) {
                  setState(() {
                    selectedFilter = value;
                  });
                },
              ),
              vGap(10),
              Text('Message', style: AppTextStyles.font14WhiteRegular),
              vGap(5),
              CustomTextFormField(
                textInputType: TextInputType.text,
                maxLines: 3,
                hintText: 'Type your Announcement ',
              ),
              vGap(5),
              CustomButton(text: 'Send', onPressed: () {} , color: Colors.blueAccent,),
            ],
          ),
        ),
      ],
    );
  }
}
