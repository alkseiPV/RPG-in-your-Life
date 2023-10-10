import 'package:equatable/equatable.dart';
import 'package:mmorpg_life/domain/entities/lvl_entity.dart';

abstract class LvlState extends Equatable{
  @override

  List<Object?> get props => [];
}

class LoadingLvlState extends LvlState{
  
}

class LoadedLvlState extends LvlState{
  final List<LvlEntity> loadedExp;

  LoadedLvlState({required this.loadedExp});
  @override
  List<Object?> get props => [loadedExp];
}