import 'package:hive_flutter/hive_flutter.dart';
import 'package:mmorpg_life/domain/entities/lvl_entity.dart';

part 'lvl_model.g.dart';

@HiveType(typeId: 3)
class LVLModel extends LvlEntity {
  @HiveField(0)
  double? experience;
  @HiveField(1)
  int? lvls;
  LVLModel({required this.experience, required this.lvls})
      : super(exp: experience, lvls: lvls);
}
