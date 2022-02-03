import 'package:dartz/dartz.dart';
import 'package:mmorpg_life/core/failure.dart';
import 'package:mmorpg_life/domain/entities/point_entity.dart';
import 'package:mmorpg_life/domain/repositories/point_repository.dart';


class GetPoints {
  final PointRepository pointRepository;

  GetPoints(this.pointRepository,);

  Future<Either<Failure, List<PointEntity>>> callPoints() async {
    return await pointRepository.initilPointet();
  }

}
