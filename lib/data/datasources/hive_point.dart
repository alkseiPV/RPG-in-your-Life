import 'package:hive_flutter/adapters.dart';
import 'package:mmorpg_life/data/datasources/hive_name.dart';

import 'package:mmorpg_life/data/models/points_model.dart';
import 'package:mmorpg_life/domain/usecases/add_point.dart';
import 'package:mmorpg_life/domain/usecases/change_point.dart';
import 'package:mmorpg_life/domain/usecases/delete_point.dart';

abstract class HivePoint {
  Future<List<PointModel>> initilPoint();
}

class LocalHivePoint implements HivePoint {
  int a = 0;
  @override
  Future<List<PointModel>> initilPoint() async {
    if (a == 0) {
      Hive.registerAdapter(PointModelAdapter());
    }

    var box = await Hive.openBox<PointModel>(HiveBoxes.toPoint);
    //box.add( PointModel(id: '1', subtitl: 'test etoi xyeti', titl: 'TEST', point:1));
    List<PointModel> af = box.values.toList();
    a = 1;
    return af;
  }
}

class DeletePointImpl implements DeletePoint {
  @override
  Future delPoint(int ind) {
    var box = Hive.box<PointModel>(HiveBoxes.toPoint);
    return box.deleteAt(ind);
  }
}

class ChangePointImpl implements ChangePoint {
  @override
  Future changeThisPoint(int indx, int changPoint) async {
    var box = Hive.box<PointModel>(HiveBoxes.toPoint);
    PointModel res = box.getAt(indx)!;
    if (changPoint == 1 || res.point! > 0) {
      box.putAt(
        indx,
        PointModel(
            point: res.point! + changPoint,
            subtitl: res.subtitl,
            titl: res.titl,
            id: res.id),
      );
    }
    return;
  }
}

class AddPointInDataImpl implements AddPointIndata {
  @override
  Future addPointInHive(String t, String subt) async {
    var box = Hive.box<PointModel>(HiveBoxes.toPoint);
    box.add(PointModel(id: " ", subtitl: subt, titl: t, point: 0));
  }
}
