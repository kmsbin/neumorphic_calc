import 'package:flutter_test/flutter_test.dart';

import '../lib/math_calc/operator_repository.dart';

void main() {
  OperatorRepository _operatorRepository;
  group("test from SumRepository", () {
    test(
        "testing SumPreparer operationPreparer functionality, must return recive string and return list of numbers ",
        () {
      _operatorRepository = SumRepository();
      expect(_operatorRepository.operationPreparer("20+20"), [20, 20]);
      expect(_operatorRepository.operationPreparer("15 + 123"), [15, 123]);
      expect(_operatorRepository.operationPreparer(" 15+123 "), [15, 123]);
    });
    test(
        "testing SumPreparer operation functionality, must return sum of 2 entries ",
        () {
      expect(_operatorRepository.operation(20, 20), 40);
      expect(_operatorRepository.operation(15, 2), 17);
      expect(_operatorRepository.operation(1, 112), 113);
    });
  });
  group("test from SubstractRepository", () {
    test(
        "testing SubtractRepository operationPreparer functionality, must return recive string and return list of numbers ",
        () {
      _operatorRepository = SubtractRepository();
      expect(_operatorRepository.operationPreparer("20-20"), [20, 20]);
      expect(_operatorRepository.operationPreparer("15 - 123"), [15, 123]);
      expect(_operatorRepository.operationPreparer(" 15-123 "), [15, 123]);
    });
    test(
        "testing SumPreparer operation functionality, must return sum of 2 entries ",
        () {
      expect(_operatorRepository.operation(20, 20), 0);
      expect(_operatorRepository.operation(15, 2), 13);
      expect(_operatorRepository.operation(1, 112), -111);
    });
  });

  group("test from OperatorRepository", () {
    test(
        "testing MultiplicatetRepository operationPreparer functionality, must return recive string and return list of numbers ",
        () {
      _operatorRepository = MultiplicateRepository();
      expect(_operatorRepository.operationPreparer("20*20"), [20, 20]);
      expect(_operatorRepository.operationPreparer("15 * 123"), [15, 123]);
      expect(_operatorRepository.operationPreparer(" 15*123 "), [15, 123]);
    });
    test(
        "testing MultiplicatetRepository operation functionality, must return sum of 2 entries ",
        () {
      expect(_operatorRepository.operation(20, 20), 400);
      expect(_operatorRepository.operation(15, 2), 30);
      expect(_operatorRepository.operation(1, 112), 112);
    });
  });
  group("test from OperatorRepository", () {
    test(
        "testing DivisionRepository operationPreparer functionality, must return recive string and return list of numbers",
        () {
      _operatorRepository = DivisionRepository();
      expect(_operatorRepository.operationPreparer("20/20"), [20, 20]);
      expect(_operatorRepository.operationPreparer("15 / 123"), [15, 123]);
      expect(_operatorRepository.operationPreparer(" 15/123 "), [15, 123]);
    });
    test(
        "testing MultiplicatetRepository operation functionality, must return sum of 2 entries ",
        () {
      expect(_operatorRepository.operation(40, 20), 2);
      expect(_operatorRepository.operation(14, 2), 7);
      expect(_operatorRepository.operation(100, 10), 10);
    });
  });
}
