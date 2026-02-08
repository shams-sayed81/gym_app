import 'package:bloc/bloc.dart';

import '../ai_service.dart';
import '../../data/models/message_model.dart';

class AiAssistantCubit extends Cubit<List<ChatMessage>> {
  final AiService _aiService;

  AiAssistantCubit(this._aiService)
    : super([
        ChatMessage(
          text:
              "Hello! I'm your AI Coach. I can help you customize your training, build meal plans, or adjust your goals. What would you like to do today?",
          isUser: false,
        ),
      ]);

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    emit([...state, ChatMessage(text: text, isUser: true)]);

    emit([...state, ChatMessage(text: '', isUser: false, isTyping: true)]);

    final reply = await _aiService.reply(text);

    emit([
      ...state.where((m) => !m.isTyping),
      ChatMessage(text: reply, isUser: false),
    ]);
  }
}
