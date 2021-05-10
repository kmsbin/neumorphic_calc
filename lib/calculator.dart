import 'package:calculator/bloc/enter_bloc.dart';
import 'package:calculator/bloc/enter_event.dart';
import 'package:calculator/neumorphic_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCalculator extends StatefulWidget {
  @override
  _HomeCalculatorState createState() => _HomeCalculatorState();
}

class _HomeCalculatorState extends State<HomeCalculator> {
  EnterBloc enterBloc = EnterBloc();
  String inputValue = '';

  @override
  void dispose() {
    enterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget operator(Widget icon, EnterEvent operation) {
      return Expanded(
        child: Container(
          margin: EdgeInsets.all(10),
          child: NeumorphicContainer(
            color: Colors.blueGrey.shade200,
            onPressed: () {
              BlocProvider.of<EnterBloc>(context).add(operation);
            },
            child: Center(child: icon),
          ),
        ),
      );
    }

    Widget button(String title) {
      return Expanded(
        child: Container(
          margin: EdgeInsets.all(10),
          child: NeumorphicContainer(
            color: Colors.blueGrey.shade200,
            onPressed: () => BlocProvider.of<EnterBloc>(context).add(NumberEvent(title)),
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 30, color: Colors.black38),
              ),
            ),
          ),
        ),
      );
    }

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.25,
              child: BlocListener<EnterBloc, String>(
                bloc: BlocProvider.of<EnterBloc>(context),
                listener: (context, state) {
                  print("ESTADO ----" + state);
                },
                child: BlocBuilder<EnterBloc, String>(
                  bloc: BlocProvider.of<EnterBloc>(context),
                  builder: (context, state) {
                    print(state);
                    return Container(
                      color: Colors.blueGrey.shade200,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        state,
                        style: TextStyle(color: Colors.black54, fontSize: 50),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          color: Colors.blueGrey.shade200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    button('7'),
                                    button('8'),
                                    button('9'),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    button('6'),
                                    button('5'),
                                    button('4'),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    button("1"),
                                    button("2"),
                                    button("3"),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    operator(
                                        Text(
                                          '.',
                                          style: TextStyle(fontSize: 30, color: Colors.black38),
                                        ),
                                        OperationEvent('.')),
                                    button("0"),
                                    operator(
                                        Text(
                                          '=',
                                          style: TextStyle(fontSize: 30, color: Colors.black38),
                                        ),
                                        EqualEvent()),
                                  ],
                                ),
                              ),
                            ],
                          ))),
                  SizedBox(
                      width: screenSize.width * 0.25,
                      child: Container(
                        color: Colors.blueGrey.shade200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: NeumorphicContainer(
                                  color: Colors.blueGrey.shade200,
                                  onLongPressed: () {
                                    BlocProvider.of<EnterBloc>(context).add(ClearAllEvent());
                                  },
                                  onPressed: () {
                                    BlocProvider.of<EnterBloc>(context).add(ClearEvent());
                                  },
                                  child: Center(
                                    child: Text(
                                      "\u232b",
                                      style: TextStyle(fontSize: 30, color: Colors.black38),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            operator(Text("\u00F7", style: TextStyle(fontSize: 30, color: Colors.black38)), OperationEvent("/")),
                            operator(Icon(Icons.clear, color: Colors.black38), OperationEvent('x')),
                            operator(Icon(Icons.remove, color: Colors.black38), OperationEvent('-')),
                            operator(Icon(Icons.add, color: Colors.black38), OperationEvent('+')),
                          ],
                        ),
                      )),
                ],
              ),
            )
          ],
        )));
  }
}
