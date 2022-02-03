import 'dart:async';

import 'package:mmorpg_life/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:mmorpg_life/data/datasources/hive_point.dart';

import 'package:mmorpg_life/domain/entities/point_entity.dart';
import 'package:mmorpg_life/domain/repositories/point_repository.dart';

class PointRepData implements PointRepository {
  final HivePoint hivePoint;

  PointRepData({
    required this.hivePoint,
  });

  @override
  Future<Either<Failure, List<PointEntity>>> initilPointet() async {
    final dataPoint = await hivePoint.initilPoint();
    return Right(dataPoint);
  }
}
