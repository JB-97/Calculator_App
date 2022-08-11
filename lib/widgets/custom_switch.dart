import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    Key? key,
    required this.switchColor,
    required this.icon1,
    required this.icon2,
    required this.onTap,
  }) : super(key: key);

  final Color switchColor;
  final IconData icon1;
  final IconData icon2;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 75,
        height: 30,
        decoration: BoxDecoration(
            color: switchColor,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                blurRadius: 1,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon1,
                color: const Color.fromARGB(255, 236, 211, 134),
              ),
              Icon(icon2, color: const Color.fromARGB(255, 190, 210, 219)),
            ],
          ),
        ),
      ),
    );
  }
}
