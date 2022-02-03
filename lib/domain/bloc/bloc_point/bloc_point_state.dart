


import 'package:equatable/equatable.dart';
import 'package:mmorpg_life/domain/entities/point_entity.dart';

abstract class PointState extends Equatable {
  @override
  
  List<Object?> get props => [];
}

class EmptyPointState extends PointState {}

class LoadingPointState extends PointState {}

class LoadedPointState extends PointState {
  final List<PointEntity> loadedPoint;
  LoadedPointState({required this.loadedPoint});
  @override
  List<Object> get props => [loadedPoint];
}

class ValidPointState extends PointState {}

class ErrorPointState extends PointState {}


