import 'package:gym_app/features/member/data/models/member_model.dart';

import '../../manager/status_ext.dart';

class SessionModel {
  final String? id;
  MemberModel? memberModel;
  DateTime? startTime;
  DateTime? endTime;
  String? location;
  SessionStatus? status;
  String? type;
  final String? coachId;
  final String? memberId;

  SessionModel({
    this.memberModel,
    this.endTime,
    this.startTime,
    this.status,
    this.location,
    this.type,
    this.coachId,
    this.memberId,
    this.id

  });
}
