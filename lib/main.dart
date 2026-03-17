import 'package:flutter/material.dart';

void main() {

  runApp(
      MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double size = 0;
  String toplvl = "";

  String input = "";

  String secondary = "";

  String operator = "";

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size.width;
    double size2 = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('@suresh_steffi', style: TextStyle(color: Colors.orangeAccent)),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    height: size2 * (15 / 100),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        toplvl,
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    height: size2 * (15 / 100),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        input,
                        style: TextStyle(color: Colors.white, fontSize: 80),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    calbut("7", Colors.grey),
                    calbut('8', Colors.grey),
                    calbut('9', Colors.grey),
                    calbut('/', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calbut("4", Colors.grey),
                    calbut('5', Colors.grey),
                    calbut('6', Colors.grey),
                    calbut('*', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calbut("1", Colors.grey),
                    calbut('2', Colors.grey),
                    calbut('3', Colors.grey),
                    calbut('-', Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calbut("0", Colors.grey),
                    calbut('.', Colors.grey),
                    calbut('=', Colors.orange),
                    calbut('+', Colors.orange),
                  ],
                ),
              ],
            ),
            Container(child: calbut("clear", Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget calbut(String txt, Color clr) {
    return InkWell(
      onTap: () {
        if (txt == "clear") {
          setState(() {
            input = "";
            secondary = "";
            operator = "";
            toplvl = "";
          });
        } else if (txt == "+" || txt == "-" || txt == "*" || txt == "/") {
          setState(() {
            secondary = input;
            input = "";
            operator = txt;
            toplvl += txt;
          });
        } else if (txt == "=") {
          double first = double.parse(secondary);
          double second = double.parse(input);
          setState(() {
            toplvl = "";
          });
          if (operator == "+") {
            setState(() {
              input = (first + second).toString();
            });
          } else if (operator == "-") {
            setState(() {
              input = (first - second).toString();
            });
          } else if (operator == "*") {
            setState(() {
              input = (first * second).toString();
            });
          } else if (operator == "/") {
            setState(() {
              input = (first / second).toString();
            });
          }
        } else {
          setState(() {
            input += txt;
            toplvl += txt;
          });
        }
      },

      child: Container(
        height: size / 5,
        width: size / 5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: clr,
        ),
        margin: EdgeInsets.all(10),
        child: Text(txt, style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
  }
}
