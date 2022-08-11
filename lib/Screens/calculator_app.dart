import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:math_expressions/math_expressions.dart';

import 'package:provider/provider.dart';

import 'package:calculator_app/provider/theme_provider.dart';

import '../widgets/widgets.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  //Logic
  String equation = '0';
  String result = '0';
  String expresion = '';
  double equationFontSize = 55;
  double resultFontSize = 30;

  void btnOnClick(String btnText) {
    setState(
      () {
        if (btnText == 'AC') {
          equationFontSize = 55;
          resultFontSize = 30;
          equation = '0';
          result = '0';
        } else if (btnText == '⌫') {
          equationFontSize = 55;
          resultFontSize = 30;
          equation = equation.substring(0, equation.length - 1);
          if (equation == '') {
            equation = '0';
          }
        } else if (btnText == '=') {
          equationFontSize = 30;
          resultFontSize = 55;
          expresion = equation;
          expresion = expresion.replaceAll('X', '*');
          try {
            Parser p = Parser();
            Expression exp = p.parse(expresion);
            ContextModel cm = ContextModel();
            result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          } catch (e) {
            result = 'Error';
          }
        } else {
          equationFontSize = 55;
          resultFontSize = 30;
          if (equation == '0') {
            equation = btnText;
          } else {
            equation += btnText;
          }
        }
      },
    );
  }

  //UI
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: themeProvider.isDarkMode
            ? const Color(0xFFF8F9FD)
            : const Color(0xFF38393D),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 15),
            CustomSwitch(
              switchColor:
                  themeProvider.isDarkMode ? Colors.white : Colors.black54,
              icon1: themeProvider.isDarkMode
                  ? Icons.wb_sunny
                  : Icons.wb_sunny_outlined,
              icon2: themeProvider.isDarkMode
                  ? Icons.nights_stay_outlined
                  : Icons.nights_stay,
              onTap: () {
                themeProvider.isDarkMode = !themeProvider.isDarkMode;
              },
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(10, 5, 16, 0),
              child: Text(
                equation,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: equationFontSize,
                    color:
                        themeProvider.isDarkMode ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(10, 5, 18, 0),
              child: Text(
                result,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: resultFontSize,
                    color: themeProvider.isDarkMode
                        ? Colors.black54
                        : Colors.white54,
                  ),
                ),
              ),
            ),
            Container(
              color: themeProvider.isDarkMode
                  ? const Color(0xFFFFFFFF)
                  : const Color(0xFF1F1F1F),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextButton(
                        text: 'AC',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFC3EED0)
                            : const Color(0xFF125124),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                      CustomTextButton(
                        text: '(',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFC3E7FF)
                            : const Color(0xFF004C79),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                      CustomTextButton(
                        text: ')',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFC3E7FF)
                            : const Color(0xFF004C79),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                      CustomTextButton(
                        text: '/',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFC3E7FF)
                            : const Color(0xFF004C79),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextButton(
                        text: '7',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFF8F9FD)
                            : const Color(0xFF28282A),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                      CustomTextButton(
                        text: '8',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFF8F9FD)
                            : const Color(0xFF28282A),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                      CustomTextButton(
                        text: '9',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFF8F9FD)
                            : const Color(0xFF28282A),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                      CustomTextButton(
                        text: 'X',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFC3E7FF)
                            : const Color(0xFF004C79),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextButton(
                        text: '4',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFF8F9FD)
                            : const Color(0xFF28282A),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                      CustomTextButton(
                        text: '5',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFF8F9FD)
                            : const Color(0xFF28282A),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                      CustomTextButton(
                        text: '6',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFF8F9FD)
                            : const Color(0xFF28282A),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                      CustomTextButton(
                        text: '-',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFC3E7FF)
                            : const Color(0xFF004C79),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextButton(
                        text: '1',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFF8F9FD)
                            : const Color(0xFF28282A),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                      CustomTextButton(
                        text: '2',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFF8F9FD)
                            : const Color(0xFF28282A),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                      CustomTextButton(
                        text: '3',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFF8F9FD)
                            : const Color(0xFF28282A),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                      CustomTextButton(
                        text: '+',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFC3E7FF)
                            : const Color(0xFF004C79),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextButton(
                        text: '0',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFF8F9FD)
                            : const Color(0xFF28282A),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                      CustomTextButton(
                        text: '.',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFF8F9FD)
                            : const Color(0xFF28282A),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                      CustomTextButton(
                        text: '⌫',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFF8F9FD)
                            : const Color(0xFF28282A),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                      CustomTextButton(
                        text: '=',
                        textColor: themeProvider.isDarkMode
                            ? const Color(0xFF061F35)
                            : const Color(0xFFFFFFFF),
                        color: themeProvider.isDarkMode
                            ? const Color(0xFFC3E7FF)
                            : const Color(0xFF004C79),
                        textSize: 30,
                        onPressed: btnOnClick,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
