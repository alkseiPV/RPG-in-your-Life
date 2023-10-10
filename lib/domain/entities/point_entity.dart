import 'package:equatable/equatable.dart';


class PointEntity extends Equatable  {
   final String? id;

  final String? titl;

  final String? subtitl;

   final int? point;

  PointEntity({
     required this.id,
     required this.titl,
     required this.subtitl,
     required this.point,
  });

  @override
  List<Object?> get props => [
        id,
        titl,
        subtitl,
        point,
      ];
}
