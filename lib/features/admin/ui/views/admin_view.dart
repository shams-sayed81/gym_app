import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/core/theme/app_colors.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:gym_app/features/auth/ui/widgets/login_view_body.dart';

import '../../../../core/enums/admin_tab.dart';
import '../widgets/admin_view_body.dart';
import '../widgets/analytics_body.dart';
import '../widgets/check_ins_body.dart';
import '../widgets/coaches_body.dart';
import '../widgets/market_body.dart';
import '../widgets/marketing_body.dart';
import '../widgets/members_body.dart';
import '../widgets/plans_body.dart';
import '../widgets/settings_body.dart';
import '../widgets/staff_body.dart';

class AdminView extends StatefulWidget {
  const AdminView({super.key});
  static const String routeName = '/admin';

  @override
  State<AdminView> createState() => _AdminViewState();
}

class _AdminViewState extends State<AdminView> {
  AdminTab _currentTab = AdminTab.dashboard;

  Widget _buildBody() {
    switch (_currentTab) {
      case AdminTab.dashboard:
        return const AdminViewBody();

      case AdminTab.members:
        return const MembersBody();

      case AdminTab.coaches:
        return CoachesBody();

      case AdminTab.plan:
        return PlansBody();

      case AdminTab.check:
        return CheckInsBody();

      case AdminTab.market:
        return const MarketBody();

      case AdminTab.analytics:
        return AnalyticsBody();

      case AdminTab.marketing:
        return MarketingBody();

      case AdminTab.staff:
        return const StaffBody();
      case AdminTab.settings:
        return SettingsBody();
    }
  }

  String _title() {
    return _currentTab.name.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.grey),
          toolbarHeight: 70.h,
          backgroundColor: AppColors.primary,

          title: ListTile(
            title: Text('Overview', style: AppTextStyles.font16WhiteBold),
            subtitle: Text(
              'Welcome back!',
              style: AppTextStyles.font14GreyRegular,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_none, color: AppColors.grey),
              onPressed: () {},
            ),
          ],
        ),

        drawer: _AppDrawer(
          currentTab: _currentTab,
          onSelect: (tab) {
            setState(() => _currentTab = tab);
            Navigator.pop(context);
          },
        ),
        backgroundColor: AppColors.primary,
        body: _buildBody(),
      ),
    );
  }
}

class _AppDrawer extends StatelessWidget {
  final AdminTab currentTab;
  final Function(AdminTab) onSelect;
  final Color color;

  const _AppDrawer({
    super.key,
    required this.currentTab,
    required this.onSelect,
    this.color = Colors.white54,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.secondary,
      child: ListView(
        children: [
          DrawerHeader(
            child: Text(
              'Gym Admin',
              style: AppTextStyles.font16WhiteBold.copyWith(
                color: AppColors.purple,
              ),
            ),
          ),

          _item(Icons.dashboard, 'Dashboard', AdminTab.dashboard),
          _item(Icons.people, 'Members', AdminTab.members),
          _item(Icons.card_giftcard, 'Coaches', AdminTab.coaches),
          _item(Icons.credit_card, 'Plans', AdminTab.plan),
          _item(Icons.person_add_alt, 'Check-ins', AdminTab.check),
          _item(Icons.receipt_long, 'Market', AdminTab.market),
          _item(Icons.bar_chart_rounded, 'Analytics', AdminTab.analytics),
          _item(Icons.percent, 'Marketing', AdminTab.marketing),
          _item(Icons.label_outline_rounded, 'Staff', AdminTab.staff),
          _item(Icons.settings, 'Settings', AdminTab.settings),
        ],
      ),
    );
  }

  Widget _item(IconData icon, String title, AdminTab tab) {
    final isSelected = tab == currentTab;

    return ListTile(
      leading: Icon(icon, color: isSelected ? AppColors.purple : color),
      title: Text(
        title,
        style: AppTextStyles.font14GreyRegular.copyWith(
          color: isSelected ? AppColors.purple : color,
        ),
      ),
      tileColor: isSelected ? AppColors.purple.withOpacity(.12) : null,
      onTap: () => onSelect(tab),
    );
  }
}
