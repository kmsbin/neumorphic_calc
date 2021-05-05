import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
class EnterState extends Equatable {
  final StringBuffer expressionBuffer = StringBuffer();
  final StringBuffer operationBuffer = StringBuffer();
  final List<String> operations = List<String>.empty(growable: true);

  void enterNewNumber(final String enteredNumber) {
    operationBuffer.clear();
    expressionBuffer.write(enteredNumber);
  }

  void enterNewOperationBuffer(final String enteredOperation) {
    operationBuffer.clear();
    operationBuffer.write(enteredOperation);
  }

  String printExpression() {
    return expressionBuffer.toString();
  }

  void clearBuffers() {
    operationBuffer.clear();
    expressionBuffer.clear();
  }

  @override
  List<Object> get props => [this.expressionBuffer, this.printExpression];

  @override
  bool get stringify => true;
}
