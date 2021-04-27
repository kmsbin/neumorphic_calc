import 'package:equatable/equatable.dart';

abstract class OperatorRepository extends Equatable {
  final String operator = '';
  double operation(double firstFactor, double secondFactor) {
    return 1.0;
  }

  List<double> operationPreparer(String operationRaw) =>
      operationRaw.split(operator).map(double.parse).toList();
}

class SumRepository extends OperatorRepository {
  @override
  final String operator = "+";

  @override
  double operation(double firstFactor, double secondFactor) {
    return firstFactor + secondFactor;
  }

  @override
  List<Object> get props => [operator, operation, operationPreparer];
}

class SubtractRepository extends OperatorRepository {
  @override
  final String operator = "-";

  @override
  double operation(firstFactor, secondFactor) {
    return firstFactor - secondFactor;
  }

  @override
  List<Object> get props => [operator, operation, operationPreparer];
}

class MultiplicateRepository extends OperatorRepository {
  @override
  final String operator = "*";

  @override
  double operation(firstFactor, secondFactor) {
    return firstFactor * secondFactor;
  }

  @override
  List<Object> get props => [operator, operation, operationPreparer];
}

class DivisionRepository extends OperatorRepository {
  @override
  final String operator = "/";

  @override
  double operation(firstFactor, secondFactor) {
    return firstFactor / secondFactor;
  }

  @override
  List<Object> get props => [operator, operation, operationPreparer];
}
