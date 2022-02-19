import 'package:equatable/equatable.dart';

class LvlEntity extends Equatable {
  final double? exp;
  final int? lvls;

  LvlEntity({required this.exp, required this.lvls});
  @override
  List<Object?> get props => [exp, lvls];
}
