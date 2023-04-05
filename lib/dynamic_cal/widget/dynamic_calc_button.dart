import 'package:calculator_project/dynamic_cal/widget/color.dart';
import 'package:flutter/material.dart';

class dynamic_calc_button extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callback;
  const dynamic_calc_button(this.text, this.fillColor, this.textColor, this.textSize, this.callback ,{super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        padding: EdgeInsets.all(22),
                        backgroundColor: Color(fillColor),
                      ),
                      onPressed: (() {
                      callback(text);
                    }), 
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: textSize,
                        color: Color(textColor),
                        fontWeight: FontWeight.bold,

                      ),
                    )),
                  )
                );
  }
}