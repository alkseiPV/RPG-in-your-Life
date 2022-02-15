import 'package:hive_flutter/hive_flutter.dart';
import 'package:mmorpg_life/data/datasources/hive_name.dart';
import 'package:mmorpg_life/data/models/lvl_model.dart';

abstract class HiveLVL {
  Future<List<LVLModel>> lvlinit();
}

class HiveLVLImpl implements HiveLVL {
  int b = 0;
  @override
  Future<List<LVLModel>>  lvlinit() async {
    if (b == 0) {
      Hive.registerAdapter(LVLModelAdapter());
    }

    var boxg = await Hive.openBox<LVLModel>(HiveBoxes.tolvl);
    boxg.add(LVLModel(experience: 0));
    List<LVLModel> lvlList = boxg.values.toList();
    b = 1;
    return lvlList;
  }
}