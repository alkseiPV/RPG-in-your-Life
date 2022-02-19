import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmorpg_life/domain/bloc/bloc_lvl/bloc_lvl_event.dart';
import 'package:mmorpg_life/domain/bloc/bloc_lvl/bloc_lvl_state.dart';
import 'package:mmorpg_life/domain/repositories/lvl_repository.dart';
import 'package:mmorpg_life/domain/usecases/lvlusecases/increment_lvl.dart';

class LvlBloc extends Bloc<LvlEvent, LvlState> {
  final LvlRepository lvlRepository;
  final IncrementLVL incrementLVL;

  LvlBloc({
    required this.lvlRepository,
    required this.incrementLVL,
  }) : super(LoadingLvlState()) {
   on<IncLvlEvent>((event, emit) async {
        emit(LoadingLvlState());
        try {

          final exp = await lvlRepository.lvlExp();
          emit(LoadedLvlState(loadedExp: exp));
      
        } catch (e) {
          print(e.toString());
        }
      });

    
  }

}
