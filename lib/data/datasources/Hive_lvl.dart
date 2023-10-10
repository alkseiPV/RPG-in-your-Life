import 'package:hive_flutter/hive_flutter.dart';
import 'package:mmorpg_life/data/datasources/hive_name.dart';
import 'package:mmorpg_life/data/models/lvl_model.dart';
import 'package:mmorpg_life/domain/usecases/lvlusecases/increment_lvl.dart';

abstract class HiveLVL {
  Future<List<LVLModel>> lvlinit();
}

class HiveLVLImpl implements HiveLVL {
  int b = 0;
  @override
  Future<List<LVLModel>> lvlinit() async {
    if (b == 0) {
      Hive.registerAdapter(LVLModelAdapter());
    }

    var boxg = await Hive.openBox<LVLModel>(HiveBoxes.tolvl);
  if(boxg.isEmpty){
     boxg.add(LVLModel(experience: 0, lvls: 0));
     boxg.add(LVLModel(experience: 0, lvls: 0));
  }

    List<LVLModel> lvlList = boxg.values.toList();
    b = 1;
    return lvlList;
  }
}

class IncrementLVLImpl implements IncrementLVL{
  @override
  Future incl(double a)async {

    var boxg =  Hive.box<LVLModel>(HiveBoxes.tolvl);
    LVLModel res= boxg.getAt(1)!;
    boxg.putAt(1, LVLModel(experience: res.experience!+a, lvls: res.lvls));
    if(res.experience!>1){
      boxg.putAt(1, LVLModel(experience: 0, lvls: res.lvls!+1));
    }if(res.experience!<0){
      boxg.putAt(1, LVLModel(experience: 0.9, lvls: res.lvls!-1));
    }if(res.experience!<0 && res.lvls==0){
      boxg.putAt(1, LVLModel(experience: 0, lvls: 0));
    }
     print(boxg.getAt(1)!.experience);
     print(boxg.getAt(1)!.lvls);
   
  }
  
}
