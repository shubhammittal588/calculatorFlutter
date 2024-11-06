import 'package:flutter/material.dart';
import 'package:calculator/model/calculation.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // Holds the current text displayed on the calculator screen
  dynamic displaytxt = '0';

  // Callback function to update the display text
  void updateDisplay(String newValue) {
    setState(() {
      displaytxt = newValue;
    });
  }

  // Widget for calculator button with custom text, background color, and text color
  Widget calcbutton(String btntxt, Color btncolor, Color txtcolor) {
    return ElevatedButton(
      onPressed: () {
        calculation(
            btntxt, updateDisplay); // Calls calculation logic with button text
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(), // Circular button shape
        backgroundColor: btncolor, // Background color of button
        padding: const EdgeInsets.all(20), // Padding around button content
      ),
      child: Text(
        btntxt, // Displayed text on the button
        style: TextStyle(
          fontSize: 35,
          color: txtcolor, // Text color of button
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Main Scaffold for calculator UI
    return Scaffold(
      backgroundColor: Colors.black, // Background color of the app
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Display section of the calculator
            SingleChildScrollView(
              scrollDirection: Axis.vertical, // Allows scrolling for large text
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '$displaytxt', // Display the current calculation or result
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 100, // Large font size for easy readability
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Row of operator buttons: AC, +/-, %, and /
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('AC', Colors.grey, Colors.black),
                calcbutton('+/-', Colors.grey, Colors.black),
                calcbutton('%', Colors.grey, Colors.black),
                calcbutton('/', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            // Row of number buttons: 7, 8, 9 and operator x
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('7', Colors.grey[850]!, Colors.white),
                calcbutton('8', Colors.grey[850]!, Colors.white),
                calcbutton('9', Colors.grey[850]!, Colors.white),
                calcbutton('x', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            // Row of number buttons: 4, 5, 6 and operator -
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('4', Colors.grey[850]!, Colors.white),
                calcbutton('5', Colors.grey[850]!, Colors.white),
                calcbutton('6', Colors.grey[850]!, Colors.white),
                calcbutton('-', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            // Row of number buttons: 1, 2, 3 and operator +
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calcbutton('1', Colors.grey[850]!, Colors.white),
                calcbutton('2', Colors.grey[850]!, Colors.white),
                calcbutton('3', Colors.grey[850]!, Colors.white),
                calcbutton('+', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            // Last row containing 0 button (expanded width), decimal point, and equals sign
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Zero button with extended width using StadiumBorder shape
                ElevatedButton(
                  onPressed: () {
                    calculation('0', updateDisplay);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.grey[850],
                    padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
                  ),
                  child: const Text(
                    '0',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
                calcbutton('.', Colors.grey[850]!, Colors.white),
                calcbutton('=', Colors.amber[700]!, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
