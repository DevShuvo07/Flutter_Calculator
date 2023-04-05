import 'package:calculator_project/dynamic_cal/widget/History.dart';
import 'package:calculator_project/dynamic_cal/widget/color.dart';
import 'package:calculator_project/dynamic_cal/widget/dynamic_calc_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calc_Functional extends StatefulWidget {
  const Calc_Functional({super.key});

  @override
  State<Calc_Functional> createState() => _Calc_FunctionalState();
}

class _Calc_FunctionalState extends State<Calc_Functional> {
  var input = '';
  var hold = '';
  var mul = '';
  double firstNum = 0;
  double secondNum = 0;
  int lenth = 0;
  var output = '';
  var operation = '';
  var hideInput = false;
  var outputSize = 30.0;
  List<String> list = [];


  // working formula
  onclickButton(value) {
    print(value);
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    }
    
    // Percentage count
    else if(value == '%'){
      mul = input[input.length-2];
      var mul2 = input.substring(0, input.length-2);
      double num1;
      num1 = double.parse(hold);
      print(num1);
      if(mul == 'x'){
        secondNum = num1 / 100;
        output = secondNum.toString();
        input = output;
        print(input);
      }
      else{
        double num = double.parse(mul2);
        print(num);
        secondNum = (num1*num)/100;
        output = secondNum.toString();
        input = mul2 + mul + output;
        print(input);
      }
    }
    //Memory function 
    else if (value == 'm+') {
      firstNum = double.parse(input);
      secondNum = secondNum + firstNum;
    } else if (value == 'mc') {
      firstNum = 0;
      secondNum = 0;
      input = '';
      output = '';
    } else if (value == 'm-') {
      firstNum = double.parse(input);
      secondNum = secondNum - firstNum;
    } else if (value == 'mr') {
      output = secondNum.toString();
    } else if (value == '+/-') {
      if (input[0] != '-') {
        input = '-' + input;
      } else {
        input = input.substring(1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll('x', '*');
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var FinalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = FinalValue.toString();
        if (output.endsWith('.0')) {
          output = output.substring(0, output.length - 2);
        }
        list.add(input + value + output.toString());
        print(list);
        input = output;
        hideInput = true;
        outputSize = 52;
      }
    } else {
      if (input.startsWith('0')) {
        input = input.substring(1, input.length);
      }
      input = input + value;
      hold = input[input.length-1];
      print(hold);
      hideInput = false;
      outputSize = 30.0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: background_color,
        body: Column(
          children: [
            // Input Output Area
            Expanded(
                child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hideInput ? '' : input,
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                        fontSize: outputSize, color: Color(0x66FFFFFF)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      history(list)
                    ],
                  )
                ],
              ),
            )),

            // Button Area....
            Row(
              children: [
                dynamic_calc_button(
                    'mc', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    'm+', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    'm-', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    'mr', fill_color, text_color, 18, onclickButton),
              ],
            ),
            Row(
              children: [
                dynamic_calc_button(
                    'AC', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    '<', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    '+/-', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    '/', function_fill_color, text_color, 18, onclickButton),
              ],
            ),
            Row(
              children: [
                dynamic_calc_button(
                    '7', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    '8', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    '9', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    'x', function_fill_color, text_color, 18, onclickButton),
              ],
            ),
            Row(
              children: [
                dynamic_calc_button(
                    '4', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    '5', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    '6', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    '-', function_fill_color, text_color, 18, onclickButton),
              ],
            ),
            Row(
              children: [
                dynamic_calc_button(
                    '1', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    '2', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    '3', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    '+', function_fill_color, text_color, 18, onclickButton),
              ],
            ),
            Row(
              children: [
                dynamic_calc_button(
                    '%', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    '0', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    '.', fill_color, text_color, 18, onclickButton),
                dynamic_calc_button(
                    '=', function_fill_color, text_color, 18, onclickButton),
              ],
            )
          ],
        ),
      ),
    );
  }
}
