import 'package:calculator/bloc/enter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum EnterState { operation, number, none }

class EnterBloc extends Bloc<EnterEvent, EnterState> {
  EnterState typeState = EnterState.none;
  StringBuffer _expressionBuffer = StringBuffer();

  EnterBloc() : super(EnterState.none);

  @override
  Stream<EnterState> mapEventToState(EnterEvent event) async* {
    if (event is OperationEvent && typeState == EnterState.operation) {
      print('operation');
      return;
    }
    if (event is OperationEvent) {
      print('operation');
      typeState = EnterState.operation;
      return;
    }
    typeState = EnterState.number;
    print(event.data);
    _expressionBuffer.write(event.data);
    yield typeState;
  }

  String printEntireExpression() {
    print(_expressionBuffer.toString());

    return _expressionBuffer.toString();
  }
}
