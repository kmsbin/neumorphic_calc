import 'package:equatable/equatable.dart';

enum Operation { multiplication, division, subtraction, summation, none }

abstract class EnterEvent {}

abstract class EnterWithDataOperationEvent extends Equatable {
  final String data = '';
}

class OperationEvent implements EnterEvent, EnterWithDataOperationEvent {
  @override
  final String data;
  OperationEvent(this.data);

  @override
  List<Object> get props => [data];

  @override
  bool get stringify => false;
}

class NumberEvent implements EnterEvent, EnterWithDataOperationEvent {
  @override
  final String data;
  NumberEvent(this.data);

  @override
  List<Object> get props => [data];

  @override
  bool get stringify => false;
}

class EqualEvent implements EnterEvent {}

class ClearEvent implements EnterEvent {}

class ClearAllEvent implements EnterEvent {}
