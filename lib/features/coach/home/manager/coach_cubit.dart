import 'package:bloc/bloc.dart';
import 'package:gym_app/core/enums/member_type.dart';
import 'package:gym_app/features/coach/home/manager/status_ext.dart';
import 'package:gym_app/features/member/data/models/member_model.dart';
import 'package:meta/meta.dart';

import '../data/models/session_model.dart';

part 'coach_state.dart';

class CoachCubit extends Cubit<CoachState> {
  CoachCubit() : super(CoachInitial());

  List<MemberModel> _allMembers = [];
  List<SessionModel> _sessions = [];

  Future<void> getCoachSessions(String coachId) async {
    emit(CoachLoading());

    await Future.delayed(const Duration(seconds: 1));

    _allMembers = [
      MemberModel(name: 'Shams', type: MemberType.fit, id: '1', sessionIds: ['1'] , age: 24),
      MemberModel(name: 'Ahmed', type: MemberType.loss, id: '2', sessionIds: ['3'], age: 23),
      MemberModel(name: 'Abdo', type: MemberType.neww, id: '3', sessionIds: ['2'], age: 24),
    ];

    _sessions = [
      SessionModel(
        type: 'Personal Training',
        location: 'Gold Gym',
        startTime: DateTime(2026, 1, 15, 10),
        endTime: DateTime(2026, 1, 15, 11),
        status: SessionStatus.ongoing,
      ),
      SessionModel(
        type: 'Personal Training',
        location: 'Gold Gym',
        startTime: DateTime(2026, 1, 16, 2),
        endTime: DateTime(2026, 1, 16, 3),
        status: SessionStatus.upcoming,
      ),
    ];

    emit(CoachesLoaded(
      sessions: _sessions,
      allMembers: _allMembers,
      filteredMembers: _allMembers,
    ));
  }

  void filterMembers(MemberType? type) {
    if (state is! CoachesLoaded) return;

    final current = state as CoachesLoaded;

    final filtered = type == null
        ? current.allMembers
        : current.allMembers.where((m) => m.type == type).toList();

    emit(CoachesLoaded(
      sessions: current.sessions,
      allMembers: current.allMembers,
      filteredMembers: filtered,
    ));
  }

}
