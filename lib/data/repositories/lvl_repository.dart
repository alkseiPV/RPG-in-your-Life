import 'package:mmorpg_life/data/datasources/Hive_lvl.dart';

import 'package:mmorpg_life/domain/repositories/lvl_repository.dart';

class LvlRepositoryImpl implements LvlRepository{
  HiveLVL hiveLVL;
  LvlRepositoryImpl(this.hiveLVL);
  @override
  Future<double> lvlExp() async{
    final datalvl=await hiveLVL.lvlinit();
    return datalvl[0].experience!;
  }
  
}