import 'package:calculator/bloc/enter_event.dart';
import 'package:calculator/bloc/enter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterBloc extends Bloc<EnterEvent, EnterState> {
  EnterState typeState = EnterState();

  EnterBloc() : super(EnterState());

  @override
  Stream<EnterState> mapEventToState(EnterEvent event) async* {
    if (event is NumberEvent) {
      typeState.enterNewNumber(event.data);
      print('number');
      print(typeState.expressionBuffer.toString());

      yield typeState;
    }
    if (event is OperationEvent) {
      typeState.enterNewOperationBuffer(event.data);
      print(typeState.expressionBuffer.toString());
      yield typeState;
    }
    yield typeState;
  }

  String printEntireExpression() {
    return typeState.operationBuffer.toString();
  }
}
