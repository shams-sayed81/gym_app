import 'package:flutter/material.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';

class StaffBody extends StatelessWidget {
  const StaffBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF111A2E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Staff Management',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.person_add, size: 16),
                  label:  Text('Add Staff' , style: AppTextStyles.font14WhiteRegular,),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// Table Header
            const StaffHeaderRow(),

            const Divider(color: Colors.white12),

            /// Rows
            const StaffRow(
              name: 'Admin User',
              role: 'Manager',
              access: 'Full Access',
            ),
            const StaffRow(
              name: 'Sarah Connor',
              role: 'Coach',
              access: 'Members, Schedule',
            ),
            const StaffRow(
              name: 'Reception Desk',
              role: 'Front Desk',
              access: 'Check-ins, POS',
            ),
          ],
        ),
      ),
    );
  }
}

class StaffHeaderRow extends StatelessWidget {
  const StaffHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          flex: 3,
          child: Text('Name',
              style: TextStyle(color: Colors.grey, fontSize: 12)),
        ),
        Expanded(
          flex: 2,
          child: Text('Role',
              style: TextStyle(color: Colors.grey, fontSize: 12)),
        ),
        Expanded(
          flex: 3,
          child: Text('Access',
              style: TextStyle(color: Colors.grey, fontSize: 12)),
        ),
        Expanded(
          child: Text('Actions',
              style: TextStyle(color: Colors.grey, fontSize: 12)),
        ),
      ],
    );
  }
}

class StaffRow extends StatelessWidget {
  final String name;
  final String role;
  final String access;

  const StaffRow({
    super.key,
    required this.name,
    required this.role,
    required this.access,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          /// Name
          Expanded(
            flex: 3,
            child: Text(
              name,
              style: const TextStyle(color: Colors.white),
            ),
          ),

          /// Role
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.05),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                role,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),

          /// Access
          Expanded(
            flex: 3,
            child: Text(
              access,
              style: const TextStyle(color: Colors.grey),
            ),
          ),

          /// Actions
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Edit',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}