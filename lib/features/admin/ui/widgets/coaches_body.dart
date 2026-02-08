import 'package:flutter/material.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/features/admin/ui/widgets/coach_container.dart';

class CoachesBody extends StatelessWidget {
  const CoachesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(

      itemBuilder: (context, index) => CoachContainer(),
      separatorBuilder: (context, index) => vGap(10),
      itemCount: 3,
    );
  }
}
