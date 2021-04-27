// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import '../lib/math_calc/operator_repository.dart';

void main() {
  group("test from OperatorRepository", () {
    OperatorRepository _operatorRepository;
    test("testing operationPreparer functionality must return a list of double",
        () {
      _operatorRepository = SumRepository();
      expect(_operatorRepository.operationPreparer("20+20"), [20, 20]);
      expect(_operatorRepository.operationPreparer("15 + 123"), [15, 123]);
      expect(_operatorRepository.operationPreparer(" 15+123 "), [15, 123]);

      expect(_operatorRepository.operation(20, 20), 40);
      expect(_operatorRepository.operation(15, 2), 17);
      expect(_operatorRepository.operation(1, 112), 113);
    });
    test("testing operationPreparer functionality must return a list of double",
        () {
      _operatorRepository = SubtractRepository();
      expect(_operatorRepository.operationPreparer("20-20"), [20, 20]);
      expect(_operatorRepository.operationPreparer("15 - 123"), [15, 123]);
      expect(_operatorRepository.operationPreparer(" 15-123 "), [15, 123]);

      expect(_operatorRepository.operation(20, 20), 0);
      expect(_operatorRepository.operation(15, 2), 13);
      expect(_operatorRepository.operation(1, 112), -111);
    });
    test("testing operationPreparer functionality must return a list of double",
        () {
      _operatorRepository = MultiplicateRepository();
      expect(_operatorRepository.operationPreparer("20*20"), [20, 20]);
      expect(_operatorRepository.operationPreparer("15 * 123"), [15, 123]);
      expect(_operatorRepository.operationPreparer(" 15*123 "), [15, 123]);

      expect(_operatorRepository.operation(20, 20), 400);
      expect(_operatorRepository.operation(15, 2), 30);
      expect(_operatorRepository.operation(1, 112), 112);
    });
    test("testing operationPreparer functionality must return a list of double",
        () {
      _operatorRepository = DivisionRepository();
      expect(_operatorRepository.operationPreparer("20/20"), [20, 20]);
      expect(_operatorRepository.operationPreparer("15 / 123"), [15, 123]);
      expect(_operatorRepository.operationPreparer(" 15/123 "), [15, 123]);

      expect(_operatorRepository.operation(40, 20), 2);
      expect(_operatorRepository.operation(14, 2), 7);
      expect(_operatorRepository.operation(100, 10), 10);
    });
  });
}
