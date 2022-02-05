import 'package:equatable/equatable.dart';

abstract class PointEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadPointEvent extends PointEvent {}

class PointOnFormSubmit extends PointEvent {
  final String titl;
  final String subtitl;

  PointOnFormSubmit({required this.titl, required this.subtitl});
}

class PointDissmis extends PointEvent {
  final int a;
  PointDissmis({required this.a});
}

class PointChangeEvent extends PointEvent {
  final int indexPoint;
  final int changePoint;

  PointChangeEvent({required this.indexPoint, required this.changePoint});
}

class BoxPointChangeEvent extends PointEvent {
  final int indexBox;
  final String newTitl;
  final String newSubTitl;

  BoxPointChangeEvent(
      {required this.indexBox,
      required this.newTitl,
      required this.newSubTitl});
}
