import 'package:dartz/dartz.dart';
import 'package:mmorpg_life/core/failure.dart';
import 'package:mmorpg_life/data/datasources/hive_goal.dart';
import 'package:mmorpg_life/domain/entities/goal_entity.dart';
import 'package:mmorpg_life/domain/repositories/goal_repository.dart';

class GoalRepositoryImpl implements GoalRepository{
  final HiveGoal hiveGoal;
  GoalRepositoryImpl({required this.hiveGoal});

  @override 
  Future<Either<Failure, List<GoalEntity>>> goalInitil()async{
    final dataGoal = await hiveGoal.goalinit();
    return Right(dataGoal);
  }
}