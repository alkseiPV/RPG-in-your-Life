import 'package:dartz/dartz.dart';
import 'package:mmorpg_life/core/failure.dart';
import 'package:mmorpg_life/domain/entities/point_entity.dart';

abstract class PointRepository  {
  Future<Either<Failure,List<PointEntity>>> initilPointet();
}
