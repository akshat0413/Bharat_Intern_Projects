import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  double _result = 0;
  String _currentOperand = "";
  String _prevOperator = "";
  bool _isOperatorClicked = false;

  void _onNumberClick(String number) {
    setState(() {
      if (_output == "0" || _isOperatorClicked) {
        _output = number;
        _isOperatorClicked = false;
      } else {
        _output += number;
      }
    });
  }

  void _onOperatorClick(String operator) {
    setState(() {
      if (_prevOperator.isNotEmpty) {
        _calculate();
      }
      _result = double.parse(_output);
      _currentOperand = operator;
      _prevOperator = operator;
      _isOperatorClicked = true;
    });
  }

  void _onEqualClick() {
    setState(() {
      _calculate();
      _currentOperand = "";
      _prevOperator = "";
    });
  }

  void _calculate() {
    if (_currentOperand == "+") {
      _result += double.parse(_output);
    } else if (_currentOperand == "-") {
      _result -= double.parse(_output);
    } else if (_currentOperand == "*") {
      _result *= double.parse(_output);
    } else if (_currentOperand == "/") {
      _result /= double.parse(_output);
    }
    _output = _result.toString();
  }

  void _onClearClick() {
    setState(() {
      _output = "0";
      _result = 0;
      _currentOperand = "";
      _prevOperator = "";
    });
  }

  void _onDelClick() {
    setState(() {
      _output = _output.substring(0, _output.length - 1);
      _result = 0;
      _currentOperand = "";
      _prevOperator = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('My Calculator'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.purple.shade100,
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  _output,
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            Divider(
              color: Colors.deepPurpleAccent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("7"),
                _buildButton("8"),
                _buildButton("9"),
                _buildOperatorButton("/"),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("4"),
                _buildButton("5"),
                _buildButton("6"),
                _buildOperatorButton("*"),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("1"),
                _buildButton("2"),
                _buildButton("3"),
                _buildOperatorButton("-"),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("0"),
                _buildButton("."),
                _buildEqualButton("="),
                _buildOperatorButton("+"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_buildClearButton("C"), _builDelButton("DEL")],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
        onPressed: () => _onNumberClick(buttonText),
        child: Text(buttonText),
      ),
    );
  }

  Widget _buildOperatorButton(String buttonText) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
      onPressed: () => _onOperatorClick(buttonText),
      child: Text(buttonText),
    );
  }

  Widget _buildEqualButton(String buttonText) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
      onPressed: _onEqualClick,
      child: Text(buttonText),
    );
  }

  Widget _buildClearButton(String buttonText) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
      onPressed: _onClearClick,
      child: Text(buttonText),
    );
  }

  Widget _builDelButton(String buttonText) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
      onPressed: _onDelClick,
      child: Text(buttonText),
    );
  }
}
