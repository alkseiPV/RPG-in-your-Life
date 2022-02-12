import 'package:hive_flutter/hive_flutter.dart';
import 'package:mmorpg_life/data/datasources/hive_name.dart';
import 'package:mmorpg_life/data/models/goal_model.dart';
import 'package:mmorpg_life/domain/usecases/goalUsecases/add_goal.dart';
import 'package:mmorpg_life/domain/usecases/goalUsecases/change_complete.dart';
import 'package:mmorpg_life/domain/usecases/goalUsecases/diss_goal.dart';

abstract class HiveGoal {
  Future<List<GoalModel>> goalinit();
}

class HiveGoalImpl implements HiveGoal {
  int b = 0;
  @override
  Future<List<GoalModel>> goalinit() async {
    if (b == 0) {
      Hive.registerAdapter(GoalModelAdapter());
    }

    var boxg = await Hive.openBox<GoalModel>(HiveBoxes.toGoal);
    List<GoalModel> goalList = boxg.values.toList();
    b = 1;
    return goalList;
  }
}

class ChangeCompleteImpl extends ChangeComplete {
  @override
  Future changeCompleteElement(int indx) async {
    var boxd = Hive.box<GoalModel>(HiveBoxes.toGoal);
    GoalModel? res = boxd.getAt(indx);
    var bb = boxd.getAt(indx)!.complete = !boxd.getAt(indx)!.complete!;
    boxd.putAt(
        indx,
        GoalModel(
          task: res!.task,
          complete: bb,
          note: res.note,
        ));
  }
}

class AddGoalHiveImpl implements AddGoalHive {
  @override
  Future addGoalInHive(String note, String task) async {
    var boxd = Hive.box<GoalModel>(HiveBoxes.toGoal);
    boxd.add(GoalModel(task: task, complete: false, note: note));
  }
}

class DisGoalImpl implements DissGoal {
  @override
  Future deleteGoal(int index) async {
    var boxd = Hive.box<GoalModel>(HiveBoxes.toGoal);
    boxd.deleteAt(index);
  }
}
