import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Calc_Button extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize;
  final Function callBack;
  const Calc_Button(
      this.text, this.fillColor, this.textColor, this.textSize, this.callBack,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(fillColor))),
          onPressed: () {
            callBack(text);
          },
          child: Text(
            text,
            style: GoogleFonts.rubik(
                textStyle:
                    TextStyle(fontSize: textSize, color: Color(textColor))),
          ),
        ),
      ),
    );
  }
}
