import 'package:flutter/material.dart';

class HomeCalculator extends StatefulWidget {
  @override
  _HomeCalculatorState createState() => _HomeCalculatorState();
}

class _HomeCalculatorState extends State<HomeCalculator> {
  String inputValue = '';
  Widget operator(IconData icon) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {},
          child: Icon(icon),
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
            setState(() {
              inputValue += title;
            });
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
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final double numbContainerWidth = MediaQuery.of(context).size.width * 0.75;
    final double operationContainerWidth = MediaQuery.of(context).size.width * 0.25;

    return Scaffold(
        appBar: null,
        backgroundColor: Colors.grey[200],
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.25,
              child: Container(
                color: Colors.amber,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(10),
                child: Text(
                  inputValue,
                  style: TextStyle(color: Colors.black54, fontSize: 50),
                ),
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
                            button("\u00F7"),
                            operator(Icons.clear),
                            operator(Icons.remove),
                            operator(Icons.add),
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
