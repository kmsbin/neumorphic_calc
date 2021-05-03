import 'package:equatable/equatable.dart';

abstract class EnterEvent extends Equatable {
  final String data = '';
}

enum Operation { multiplication, division, subtraction, summation, none }

class OperationEvent implements EnterEvent {
  @override
  final String data;
  OperationEvent(this.data);

  @override
  List<Object> get props => [data];

  @override
  bool get stringify => false;
}

class NumberEvent implements EnterEvent {
  @override
  final String data;
  NumberEvent(this.data);

  @override
  List<Object> get props => [data];

  @override
  bool get stringify => false;
}
