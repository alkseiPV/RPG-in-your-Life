import 'package:hive_flutter/hive_flutter.dart';

part 'lvl_model.g.dart';

@HiveType(typeId: 3)
class LVLModel extends HiveObject {
  @HiveField(0)
  final double? experience;
  LVLModel({required this.experience});
}
