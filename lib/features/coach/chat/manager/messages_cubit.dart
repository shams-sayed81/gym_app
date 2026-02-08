import 'package:bloc/bloc.dart';

import '../../../../core/enums/messages_tab.dart';
import '../data/chat_model.dart';
import 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit() : super(MessagesInitial()) {
    changeTab(MessagesTab.all);
  }
  final List<CoachChatMessage> _allChats = [
    CoachChatMessage(
      name: 'Omar Ali',
      message: "Hey coach, I can't make it today.",
      type: MessageType.member,
      time: '10:30 AM',
    ),
    CoachChatMessage(
      name: 'System',
      message: 'New member assigned: Mike Ross',
      type: MessageType.system,
      time: 'Yesterday',
    ),
    CoachChatMessage(
      name: 'Sarah Connor',
      message: 'Thanks for the session!',
      type: MessageType.member,
      time: 'Yesterday',
    ),
  ];

  MessagesTab currentTab = MessagesTab.all;


  void changeTab(MessagesTab tab) {
    currentTab = tab;

    List<CoachChatMessage> result;

    switch (tab) {
      case MessagesTab.members:
        result = _allChats
            .where((e) => e.type == MessageType.member)
            .toList();
        break;

      case MessagesTab.system:
        result = _allChats
            .where((e) => e.type == MessageType.system)
            .toList();
        break;

      case MessagesTab.all:
        result = _allChats;
    }

    emit(MessagesLoaded(
      selectedTab: tab,
      filteredChats: result,
    ));
  }
}
