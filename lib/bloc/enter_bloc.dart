import 'package:calculator/bloc/enter_event.dart';
import 'package:calculator/bloc/enter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterBloc extends Bloc<EnterEvent, String> {
  EnterState typeState = EnterState();

  EnterBloc() : super("");

  @override
  Stream<String> mapEventToState(EnterEvent event) async* {
    if (event is NumberEvent) {
      print("NumberEvent");
      typeState.enterNewNumber(event.data);
      yield typeState.printExpression();
    }
    if (event is OperationEvent) {
      print("OperationEvent");
      typeState.enterNewOperationBuffer(event.data);
      yield typeState.printExpression();
    }
    if (event is EqualEvent) {
      print("EqualEvent");
      yield typeState.equals();
    }
    if (event is ClearEvent) {
      typeState.clearLast();
      print("ClearEvent");
      yield typeState.printExpression();
    }
    if (event is ClearAllEvent) {
      typeState.clearAll();
      print("ClearEvent");
      yield typeState.printExpression();
    }
  }
}
