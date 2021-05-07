import 'package:calculator/math_calc/operator_repository.dart';
import 'package:equatable/equatable.dart';

class EnterState extends Equatable {
  final List<String> operations = List<String>.empty(growable: true);
  final List<String> numbersParameters = List<String>.filled(1, '', growable: true);
  final StringBuffer operationsBuffer = StringBuffer();
  final Map<String, OperatorRepository> mathOperatorMap = {
    '+': SumRepository(),
    '-': SubtractRepository(),
    '/': DivisionRepository(),
    'x': MultiplicateRepository(),
  };

  void enterNewNumber(final String enteredNumber) {
    if (numbersParameters.isEmpty) {
      numbersParameters.add('');
    }
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
    if (numbersParameters.length > 0) {
      String expression = numbersParameters.length > 0 ? numbersParameters.first : '';
      operations?.asMap()?.forEach((key, value) {
        expression += value;
        expression += numbersParameters[key + 1];
      });
      return expression;
    }
    return '';
  }

  String equals() {
    operations?.asMap()?.forEach((key, value) {
      numbersParameters[key + 1] = mathOperatorMap[value].operation(double.parse(numbersParameters[key]), double.parse(numbersParameters[key + 1])).toString();
    });
    String expression = numbersParameters.last;
    operations.clear();
    numbersParameters.clear();
    return expression;
  }

  String printExpression() {
    return _interlayOperationWithNumbers();
  }

  void clearLast() {
    print('----------- clear last -----------');
    if (numbersParameters.length > 0 || operations.length > 0) {
      if (numbersParameters?.last == '') {
        if (operations.length > 0) {
          operations?.removeLast();
        }
        numbersParameters?.removeLast();
        return;
      }
      if (operations.length == numbersParameters.length) {
        operations?.removeLast();
        return;
      }
      numbersParameters?.last = numbersParameters?.last?.substring(0, numbersParameters.last.length - 1);
    }
  }

  void clearAll() {
    print('clear all');
    operations.clear();
    numbersParameters.clear();
    numbersParameters.add('');
  }

  @override
  List<Object> get props => [this.numbersParameters, this.printExpression];

  @override
  bool get stringify => true;
}
