import 'package:get_it/get_it.dart';
import 'package:mmorpg_life/data/datasources/hive_goal.dart';
import 'package:mmorpg_life/data/datasources/hive_point.dart';
import 'package:mmorpg_life/data/repositories/goal_repository_data.dart';
import 'package:mmorpg_life/data/repositories/point_repository_data.dart';
import 'package:mmorpg_life/domain/bloc/bloc_goal/bloc_goals.dart';
import 'package:mmorpg_life/domain/bloc/bloc_point/bloc_points.dart';
import 'package:mmorpg_life/domain/repositories/goal_repository.dart';
import 'package:mmorpg_life/domain/repositories/point_repository.dart';
import 'package:mmorpg_life/domain/usecases/add_point.dart';
import 'package:mmorpg_life/domain/usecases/box_point_change.dart';
import 'package:mmorpg_life/domain/usecases/change_point.dart';
import 'package:mmorpg_life/domain/usecases/delete_point.dart';

import 'package:mmorpg_life/domain/usecases/get_points.dart';
import 'package:mmorpg_life/domain/usecases/goalUsecases/add_goal.dart';
import 'package:mmorpg_life/domain/usecases/goalUsecases/change_complete.dart';
import 'package:mmorpg_life/domain/usecases/goalUsecases/diss_goal.dart';
import 'package:mmorpg_life/domain/usecases/goalUsecases/get_goals.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory(() => PointBloc(
        getPoints: sl(),
        deletePoint: sl(),
        changePoint: sl(),
        addPointIndata: sl(),
        boxPointChange: sl(),
      ));

  sl.registerFactory(() => GoalBloc(
        getGoals: sl(),
        changeComplete: sl(),
        addGoalHive: sl(),
        dissGoal: sl(),
      ));

  //usecase
  sl.registerLazySingleton(() => GetPoints(sl()));
  sl.registerLazySingleton<DeletePoint>(() => DeletePointImpl());
  sl.registerLazySingleton<ChangePoint>(() => ChangePointImpl());
  sl.registerLazySingleton<AddPointIndata>(() => AddPointInDataImpl());
  sl.registerLazySingleton<BoxPointChange>(() => BoxPointChangeImpl());

  sl.registerLazySingleton(() => GetGoals(sl()));
  sl.registerLazySingleton<ChangeComplete>(() => ChangeCompleteImpl());
  sl.registerLazySingleton<AddGoalHive>(() => AddGoalHiveImpl());
  sl.registerLazySingleton<DissGoal>(() => DisGoalImpl());
//repository
  sl.registerLazySingleton<PointRepository>(
      () => PointRepData(hivePoint: sl()));

  sl.registerLazySingleton<GoalRepository>(
      () => GoalRepositoryImpl(hiveGoal: sl()));

  sl.registerLazySingleton<HivePoint>(() => LocalHivePoint());
  sl.registerLazySingleton<HiveGoal>(() => HiveGoalImpl());
}
