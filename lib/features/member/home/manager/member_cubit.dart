import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/core/enums/member_type.dart';
import 'package:gym_app/core/helpers/app_constants.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../data/models/coach_model.dart';
import '../../data/models/member_model.dart';
import 'member_state.dart';

class MemberCubit extends Cubit<MemberState> {
  MemberCubit() : super(MemberLoading());

  Future<void> loadMember() async {
    try {
      emit(MemberLoading());

      final member = MemberModel(
        name: 'Shams Sayed',
        weight: 63,
        waterL: 2,
        sleepHrs: 10,
        type: MemberType.loss
      );



      emit(MemberLoaded(member));
    } catch (e) {
      emit(const MemberError('Failed to load member'));
    }
  }


  Future<void> loadCoaches() async {
    try {
      emit(MemberLoading());

      final coaches = [
      CoachModel(
        id: '1',
        name: 'Ahmed Hassan',
        jobTitle: 'Certified Personal Trainer',
        price: 300,
        rating: 4.8,
        reviewsCount: 120,
        bio: 'Helping people transform their bodies and build healthy habits.',
        service: 'Custom Workout Plan',
        turnaround: '24-48 hrs'
      ),
        CoachModel(
          id: '1',
          name: 'Ahmed Hassan',
          jobTitle: 'Certified Personal Trainer',
          price: 300,
          rating: 4.8,
          reviewsCount: 120,
          bio: 'Helping people transform their bodies and build healthy habits.',
            service: 'Custom Workout Plan',
            turnaround: '24-48 hrs'

        )
      ];
      emit(CoachLoaded(coaches));
    } catch (e) {
      emit(const MemberError('Failed to load member'));
    }
  }

  void increaseWeight() {
    if (state is MemberLoaded) {
      final current = (state as MemberLoaded).member;

      emit(MemberLoaded(current.copyWith(weight: (current.weight ?? 0) + 0.1)));
    }
  }

  void decreaseWeight() {
    if (state is MemberLoaded) {
      final current = (state as MemberLoaded).member;

      emit(
        MemberLoaded(
          current.copyWith(weight: ((current.weight ?? 0) - 0.1).clamp(0, 500)),
        ),
      );
    }
  }

  void updateWeight(double weight) {
    if (state is! MemberLoaded) return;

    final current = (state as MemberLoaded).member;

    final newWeight = double.parse(weight.clamp(0, 500).toStringAsFixed(1));

    emit(MemberLoaded(current.copyWith(weight: newWeight)));
  }

  void updateSleepHrs(double hours) {
    if (state is! MemberLoaded) return;
    final current = (state as MemberLoaded).member;

    emit(MemberLoaded(current.copyWith(sleepHrs: hours)));
  }

  void updateWaterL(double liters) {
    if (state is! MemberLoaded) return;
    final current = (state as MemberLoaded).member;

    final newWater = double.parse(liters.clamp(0, 10).toStringAsFixed(1));

    emit(MemberLoaded(current.copyWith(waterL: newWater)));
  }


// ================= WORKOUT TIMER =================


  int currentExercise = 0;
  int totalExercises = 8;
  bool isWorkoutPaused = false;
  bool isRunning = false;


  int totalSeconds = 0;
  Timer? _timer;


  Future<void> restoreWorkout() async {
    currentExercise = await SharedPrefHelper.getInt(AppConstants.kWorkoutExerciseKey) ?? 0;
    emit(MemberUpdated());
  }

  String get totalTime {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return "${minutes.toString().padLeft(2,'0')}:${seconds.toString().padLeft(2,'0')}";
  }


  void startWorkout() {
    if (isRunning) return;
    isRunning = true;
    isWorkoutPaused = false;
    _startTimer();
    emit(MemberUpdated());
  }


  void togglePause() {
    if (!isRunning) return;
    isWorkoutPaused = !isWorkoutPaused;
    if (isWorkoutPaused) {
      _timer?.cancel();
    } else {
      _startTimer();
    }
    emit(MemberUpdated());
  }


  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (!isWorkoutPaused) {
        totalSeconds++;
        emit(MemberUpdated());
      }
    });
  }


  void nextExercise() {
    if (currentExercise < totalExercises - 1) {
      currentExercise++;
      emit(MemberUpdated());
    }
  }


  void previousExercise() {
    if (currentExercise > 0) {
      currentExercise--;
      emit(MemberUpdated());
    }
  }


  void finishWorkout() {
    _timer?.cancel();
    isRunning = false;
    isWorkoutPaused = false;
    emit(MemberUpdated());
  }
}

