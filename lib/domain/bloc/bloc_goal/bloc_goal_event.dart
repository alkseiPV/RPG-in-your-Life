import 'package:equatable/equatable.dart';

abstract class GoalEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadGoalEvent extends GoalEvent {}

class SubmitGoalEvent extends GoalEvent {
  final String note;
  final String task;
  SubmitGoalEvent({required this.note, required this.task});
}

class CompleteGoalEvent extends GoalEvent{
  final int index;

  CompleteGoalEvent({required this.index});

}

class DismissGoalEvent extends GoalEvent{
  final int index;
  DismissGoalEvent({required this.index});
}
