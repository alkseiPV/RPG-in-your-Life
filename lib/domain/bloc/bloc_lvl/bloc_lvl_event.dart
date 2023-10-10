import 'package:equatable/equatable.dart';

abstract class LvlEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class IncLvlEvent extends LvlEvent{

}

class DicLvlEvent extends LvlEvent{

}

class DelLvlEvent extends LvlEvent{
  
}