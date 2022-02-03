import 'package:get_it/get_it.dart';
import 'package:mmorpg_life/data/datasources/hive_point.dart';
import 'package:mmorpg_life/data/repositories/point_repository_data.dart';
import 'package:mmorpg_life/domain/bloc/bloc_point/bloc_points.dart';
import 'package:mmorpg_life/domain/repositories/point_repository.dart';
import 'package:mmorpg_life/domain/usecases/add_point.dart';
import 'package:mmorpg_life/domain/usecases/change_point.dart';
import 'package:mmorpg_life/domain/usecases/delete_point.dart';

import 'package:mmorpg_life/domain/usecases/get_points.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //bloc
  sl.registerFactory(() => PointBloc(
        getPoints: sl(),
        deletePoint: sl(),
        changePoint: sl(),
        addPointIndata: sl()
      ));

  //usecase
  sl.registerLazySingleton(() => GetPoints(sl()));
  sl.registerLazySingleton<DeletePoint>(() => DeletePointImpl());
  sl.registerLazySingleton<ChangePoint>(() => ChangePointImpl());
  sl.registerLazySingleton<AddPointIndata>(() => AddPointInDataImpl());

//repository
  sl.registerLazySingleton<PointRepository>(
      () => PointRepData(hivePoint: sl()));

  sl.registerLazySingleton<HivePoint>(() => LocalHivePoint());
}
