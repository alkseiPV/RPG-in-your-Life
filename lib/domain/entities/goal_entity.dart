import 'package:equatable/equatable.dart';

class GoalEntity extends Equatable {
  final String? task;
  final String? note;
  final bool? complete;

  GoalEntity({
    required this.task,
    required this.note,
    required this.complete,
  });

  @override
  List<Object?> get props => [task, note, complete];
}
