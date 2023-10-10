import 'package:mmorpg_life/domain/entities/lvl_entity.dart';

abstract class LvlRepository{
  Future<List<LvlEntity>> lvlExp();
}