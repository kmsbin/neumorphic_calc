import 'package:calculator/bloc/enter_bloc.dart';
import 'package:calculator/bloc/enter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCalculator extends StatefulWidget {
  @override
  _HomeCalculatorState createState() => _HomeCalculatorState();
}

class _HomeCalculatorState extends State<HomeCalculator> {
  EnterBloc enterBloc = EnterBloc();
  String inputValue = '';
  Widget operator(Widget icon, String operation) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            enterBloc.add(OperationEvent(operation));
          },
          child: icon,
        ),
      ),
    );
  }

  Widget button(String title) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            enterBloc.add(NumberEvent(title));

            // inputValue += title;
          },
          child: Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    enterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.25,
              child: BlocBuilder<EnterBloc, EnterState>(
                bloc: enterBloc,
                builder: (context, state) {
                  return Container(
                    color: Colors.amber,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      state.toString(),
                      style: TextStyle(color: Colors.black54, fontSize: 50),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          color: Colors.blue,
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
                                    button("."),
                                    button("0"),
                                    button("="),
                                  ],
                                ),
                              ),
                            ],
                          ))),
                  SizedBox(
                      width: screenSize.width * 0.25,
                      child: Container(
                        color: Colors.yellow,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                child: ElevatedButton(
                                  onLongPress: () {
                                    print('sdgfgdf');
                                    setState(() {
                                      inputValue = "";
                                    });
                                  },
                                  onPressed: () {
                                    setState(() {
                                      if (inputValue.length > 0) {
                                        inputValue = inputValue.substring(0, inputValue.length - 1);
                                      }
                                    });
                                  },
                                  child: Text(
                                    "\u232b",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            operator(
                                Text(
                                  "\u00F7",
                                  style: TextStyle(fontSize: 30),
                                ),
                                "\u00F7"),
                            operator(Icon(Icons.clear), 'x'),
                            operator(Icon(Icons.remove), '-'),
                            operator(Icon(Icons.add), '+'),
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
