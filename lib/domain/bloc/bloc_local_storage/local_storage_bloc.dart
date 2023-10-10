import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmorpg_life/domain/bloc/bloc_local_storage/local_storage_event.dart';
import 'package:mmorpg_life/domain/bloc/bloc_local_storage/local_storage_state.dart';
import 'package:mmorpg_life/domain/usecases/local_storage_usecases.dart';

class LocalStorageBloc extends Bloc<LocalStorageEvent, LocalStorageState> {
  LocalStorageUseCases localStorageUseCases;
  LocalStorageBloc(this.localStorageUseCases)
      : super(EmptyLocalStorageState()) {
    on<GetInfoEvent>((event, emit) async {
      emit(LoadingLocalStorage());

      String result = await localStorageUseCases.readInfo(event.key);
      emit(LoadedLocalStorage(value: result));
    });

    on<PutInfoEvent>((event, emit) async {
      localStorageUseCases.writeInfo(event.key, event.value);

      Future.delayed(Duration(milliseconds: 300), () {
        this.add(GetInfoEvent('name'));
      });
    });
  }
}
