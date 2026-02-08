import 'package:flutter/material.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/features/admin/data/plan_model.dart';
import 'package:gym_app/features/admin/ui/widgets/plan_card.dart';

class PlansBody extends StatelessWidget {
  const PlansBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<PlanModel> plans = [
      PlanModel(access: ['Gym access' , 'Locker'], price: 50, name: 'Basic', active: 440),
      PlanModel(access: ['Gym access' , 'Locker', 'Group Classes', 'Sauna'], price: 90, name: 'Pro', active: 300),
      PlanModel(access: ['All access' , 'Private Parking', '1 PT session/month', ' Service'], price: 150, name: 'VIP', active: 100),
    ];
    return ListView.separated(
      itemBuilder: (context, index) => PlanCard(planModel: plans[index]),
      separatorBuilder: (context, index) => vGap(10),
      itemCount: plans.length,
    );
  }
}
