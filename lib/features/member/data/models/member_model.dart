import 'package:gym_app/core/enums/member_type.dart';

enum MemberStatus { active, inactive, frozen, expiring }

class MemberModel {
  final String? id;
  final String? name;
  final double? weight;
  final double? sleepHrs;
  final double? waterL;
  final List<String>? sessionIds;
  final MemberType? type;
  final double? age;
  final String? plan;
  final MemberStatus? status;
  final String? lastCheckIn;

  MemberModel({
    this.id,
    this.name,
    this.weight,
    this.sleepHrs,
    this.waterL,
    this.sessionIds,
    this.type,
    this.age,
    this.plan,
    this.status,
    this.lastCheckIn,
  });

  MemberModel copyWith({
    String? id,
    String? name,
    double? weight,
    double? sleepHrs,
    double? waterL,
    List<String>? sessionIds,
    MemberType? type,
    double? age,
    String? plan,
    MemberStatus? status,
    String? lastCheckIn,
  }) {
    return MemberModel(
      id: id ?? this.id,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      sleepHrs: sleepHrs ?? this.sleepHrs,
      waterL: waterL ?? this.waterL,
      sessionIds: sessionIds ?? this.sessionIds,
      type: type ?? this.type,
      age: age ?? this.age,
      plan: plan ?? this.plan,
      status: status ?? this.status,
      lastCheckIn: lastCheckIn ?? this.lastCheckIn,
    );
  }
}
