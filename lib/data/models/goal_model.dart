import 'package:hive/hive.dart';
import 'package:mmorpg_life/domain/entities/goal_entity.dart';

part 'goal_model.g.dart';

@HiveType(typeId: 2)
class GoalModel extends GoalEntity {
  @HiveField(0)
  final String? task;
  @HiveField(1)
  final String? note;
  @HiveField(2)
  bool? complete;

  GoalModel({
    required this.task,
    required this.complete,
    required this.note,
  }) : super(
          complete: complete,
          task: task,
          note: note,
        );
}
