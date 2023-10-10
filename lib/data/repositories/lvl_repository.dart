import 'package:mmorpg_life/data/datasources/Hive_lvl.dart';

import 'package:mmorpg_life/domain/entities/lvl_entity.dart';

import 'package:mmorpg_life/domain/repositories/lvl_repository.dart';

class LvlRepositoryImpl implements LvlRepository{
  HiveLVL hiveLVL;
  LvlRepositoryImpl({required this.hiveLVL});
  @override
  Future<List<LvlEntity>> lvlExp() async{
    final datalvl=await hiveLVL.lvlinit();
    return datalvl;
  }
  
}