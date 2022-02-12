import 'package:equatable/equatable.dart';
import 'package:mmorpg_life/domain/entities/goal_entity.dart';

abstract class GoalState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingGoalState extends GoalState {}

class LoadedGoalState extends GoalState {
  final List<GoalEntity> loadedGoal;
  LoadedGoalState({required this.loadedGoal});
  @override
  List<Object?> get props => [loadedGoal];
}

class ErrorGoalstate extends GoalState {}
