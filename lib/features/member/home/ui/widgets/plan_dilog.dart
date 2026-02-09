import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum DayStatus { past, today, future }

DayStatus getDayStatus(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final day = DateTime(date.year, date.month, date.day);

  if (day.isBefore(today)) return DayStatus.past;
  if (day.isAtSameMomentAs(today)) return DayStatus.today;
  return DayStatus.future;
}

// ================= First Dialog =================
void showWeekDialog(BuildContext context) {
  final startOfWeek = DateTime.now();
  final List<String> parts = ['Upper Body', 'Lower Body'];

  showDialog(
    context: context,
    builder: (_) => Dialog(
      backgroundColor: const Color(0xFF0D1B2A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(7, (index) {
              final date = startOfWeek.add(Duration(days: index));
              final status = getDayStatus(date);

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${DateFormat('EEE, dd MMM').format(date)}',
                      style: TextStyle(
                        color: status == DayStatus.today
                            ? Colors.greenAccent
                            : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: parts.map((part) {
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context); // Close first dialog
                              showPartDialog(context, date, part, status);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: status == DayStatus.past
                                    ? Colors.grey[800]
                                    : status == DayStatus.today
                                    ? Colors.green[800]
                                    : Colors.grey[700],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  part,
                                  style: TextStyle(
                                    color: status == DayStatus.past
                                        ? Colors.grey
                                        : Colors.white,
                                    decoration: status == DayStatus.past
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    ),
  );
}

// ================= Second Dialog =================
void showPartDialog(
    BuildContext context, DateTime date, String part, DayStatus status) {
  // Dummy exercises
  final exercises = part == 'Upper Body'
      ? ['Bench Press', 'Shoulder Press', 'Chest Fly']
      : ['Squats', 'Lunges', 'Deadlift'];

  showDialog(
    context: context,
    builder: (_) => Dialog(
      backgroundColor: const Color(0xFF0D1B2A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${part} Exercises',
              style: const TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...exercises.map((e) {
              final done = status == DayStatus.past;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Icon(
                      done ? Icons.check_circle : Icons.radio_button_unchecked,
                      color: done ? Colors.greenAccent : Colors.grey,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      e,
                      style: TextStyle(
                        color: done ? Colors.grey : Colors.white,
                        decoration: done ? TextDecoration.lineThrough : null,
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: status == DayStatus.today
                      ? Colors.greenAccent
                      : Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {},
                child: Text(
                  status == DayStatus.past ? 'View Summary' : 'Start Workout',
                  style: TextStyle(
                      color: status == DayStatus.today ? Colors.black : Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

// ================== Example Usage ==================
class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Workout Plan')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showWeekDialog(context),
          child: const Text('View Weekly Plan'),
        ),
      ),
    );
  }
}