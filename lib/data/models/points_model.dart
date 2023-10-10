import 'package:hive/hive.dart';
import 'package:mmorpg_life/domain/entities/point_entity.dart';

part 'points_model.g.dart';

@HiveType(typeId: 1)
class PointModel extends PointEntity  {
  @HiveField(3)
 final String? id;
  @HiveField(0)
 final String? titl;
  @HiveField(1)
 final String? subtitl;
  @HiveField(2)
 final int? point;

  PointModel({
    required this.point,
    required this.subtitl,
    required this.titl,
    required this.id,
  }) : super(
          id: id,
          subtitl: subtitl,
          titl: titl,
          point: point,
        );
}
