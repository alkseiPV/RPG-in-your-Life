import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mmorpg_life/domain/bloc/bloc_point/bloc_point_event.dart';
import 'package:mmorpg_life/domain/bloc/bloc_point/bloc_point_state.dart';
import 'package:mmorpg_life/domain/usecases/add_point.dart';
import 'package:mmorpg_life/domain/usecases/change_point.dart';
import 'package:mmorpg_life/domain/usecases/delete_point.dart';

import 'package:mmorpg_life/domain/usecases/get_points.dart';

class PointBloc extends Bloc<PointEvent, PointState> {
  final GetPoints getPoints;
  final DeletePoint deletePoint;
  final ChangePoint changePoint;
  final AddPointIndata addPointIndata;
  PointBloc({required this.getPoints, required this.deletePoint, required this.changePoint, required this.addPointIndata})
      : super(LoadingPointState()) {
    on<LoadPointEvent>((event, emit) async {
      emit(LoadingPointState());
      try {
        final box = await getPoints.callPoints();
        print('av');

        emit(box.fold((failure) => ErrorPointState(),
            (point) => LoadedPointState(loadedPoint: point)));
      } catch (e) {
        print(e.toString());
      }
    });
    on<PointDissmis>((event, emit) async {
      deletePoint.delPoint(event.a);

    });
    on<PointChangeEvent>((event, emit)async{
changePoint.changeThisPoint(event.indexPoint, event.changePoint);
    });
    on<PointOnFormSubmit>((event, emit)async{
      addPointIndata.addPointInHive(event.titl, event.subtitl);
    });
  }

}
