import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final double textSize;
  final Color textColor;
  final Function onPressed; 

  const CustomTextButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
    required this.textSize, required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 70,
      width: 70,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          backgroundColor: color,
        ),
        onPressed: () => onPressed(text),
        child: Text(
          text,
          style: GoogleFonts.rubik(
            textStyle: TextStyle(fontSize: textSize, color: textColor),
          ),
        ),
      ),
    );
  }
}
