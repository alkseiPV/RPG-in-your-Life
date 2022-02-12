import 'package:dartz/dartz.dart';
import 'package:mmorpg_life/core/failure.dart';
import 'package:mmorpg_life/domain/entities/goal_entity.dart';

abstract class GoalRepository{
  Future<Either<Failure,List<GoalEntity>>> goalInitil();
}