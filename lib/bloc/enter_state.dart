import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class EnterState extends Equatable {
  final List<String> operations = List<String>.filled(1, '', growable: true);
  final List<String> numbersParameters = List<String>.filled(1, '', growable: true);
  final StringBuffer operationsBuffer = StringBuffer();

  void enterNewNumber(final String enteredNumber) {
    numbersParameters.last += enteredNumber;
    operationsBuffer.clear();
  }

  void enterNewOperationBuffer(final String enteredOperation) {
    if (operationsBuffer.isEmpty) {
      operationsBuffer.write(enteredOperation);
      operations.add(enteredOperation);
      numbersParameters.add('');
      return;
    }
    operations.last = enteredOperation;
  }

  String _interlayOperationWithNumbers() {
    String expression = '';
    print(operations);
    print(numbersParameters);

    operations.asMap().forEach((key, value) {
      expression += value;
      expression += numbersParameters[key];
    });
    return expression;
  }

  String printExpression() {
    return _interlayOperationWithNumbers();
  }

  void clearBuffers() {
    numbersParameters.clear();
  }

  @override
  List<Object> get props => [this.numbersParameters, this.printExpression];

  @override
  bool get stringify => true;
}
