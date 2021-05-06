import 'package:calculator/bloc/enter_event.dart';
import 'package:calculator/bloc/enter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterBloc extends Bloc<EnterEvent, String> {
  EnterState typeState = EnterState();

  EnterBloc() : super('');

  @override
  Stream<String> mapEventToState(EnterEvent event) async* {
    if (event is NumberEvent) {
      typeState.enterNewNumber(event.data);
      print('number');
      // print(typeState.expressionBuffer.toString());

      yield typeState.printExpression();
    } else if (event is OperationEvent) {
      typeState.enterNewOperationBuffer(event.data);
      // print(typeState.expressionBuffer.toString());
      yield typeState.printExpression();
    }
    // yield typeState.printExpression();
  }
}
