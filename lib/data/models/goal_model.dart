import 'package:hive/hive.dart';

part 'goal_model.g.dart';

@HiveType(typeId: 0)
class GoalModel extends HiveObject{
  @HiveField(0)
  bool? complete;
  @HiveField(1)
  String? id;
  @HiveField(2)
  String? note;
  @HiveField(3)
  String? task;
  GoalModel({this.complete = false, this.note = '', this.task});
}
