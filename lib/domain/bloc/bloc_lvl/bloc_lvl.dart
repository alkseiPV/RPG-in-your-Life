import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmorpg_life/domain/bloc/bloc_lvl/bloc_lvl_event.dart';
import 'package:mmorpg_life/domain/bloc/bloc_lvl/bloc_lvl_state.dart';
import 'package:mmorpg_life/domain/repositories/lvl_repository.dart';

class LvlBloc extends Bloc<LvlEvent,LvlState >{
 final LvlRepository lvlRepository;

 LvlBloc({required this.lvlRepository}):super(LoadingLvlState()){
   on<IncLvlEvent>((event, emit) async{
     final lvl = await lvlRepository.lvlExp();
   });
   on<DicLvlEvent>((event, emit) {

   });
   on<DelLvlEvent>((event, emit){

   });
 }
}