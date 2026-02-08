
import 'package:gym_app/core/enums/messages_tab.dart';


class CoachChatMessage {
  final String name;
  final String message;
  final MessageType type;
  final String time;

  CoachChatMessage({
    required this.name,
    required this.message,
    required this.type,
    required this.time,
  });
}
