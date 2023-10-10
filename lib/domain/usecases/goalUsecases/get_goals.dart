import 'package:dartz/dartz.dart';
import 'package:mmorpg_life/core/failure.dart';
import 'package:mmorpg_life/domain/entities/goal_entity.dart';
import 'package:mmorpg_life/domain/repositories/goal_repository.dart';

class GetGoals{
  final GoalRepository goalRepository;
  GetGoals(this.goalRepository);

  Future<Either<Failure,List<GoalEntity>>> callGoals() async{
    return await goalRepository.goalInitil();
  }
}