import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Button extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  late final Color bgColor;
  late final Color fgColor;
  late final double borderWidth;
  late final bool hasBoxShadow;

  Button.primary({Key? key, this.onTap, required this.text}) : super(key: key) {
    bgColor = Colors.purple;
    fgColor = Colors.white;
    borderWidth = 0;
    hasBoxShadow = true;
  }

  Button.secondary({Key? key, this.onTap, required this.text})
      : super(key: key) {
    bgColor = Colors.transparent;
    fgColor = Colors.purple;
    borderWidth = 3;
    hasBoxShadow = false;
  }

  Button.tertiary({Key? key, this.onTap, required this.text})
      : super(key: key) {
    bgColor = Colors.transparent;
    fgColor = Colors.purple;
    borderWidth = 0;
    hasBoxShadow = false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: fgColor, width: borderWidth),
            boxShadow: [
              if (hasBoxShadow)
                const BoxShadow(
                  blurRadius: 10,
                  color: Color.fromARGB(25, 0, 0, 0),
                  offset: Offset(0, 4),
                )
            ]),
        child: Text(text, style: TextStyle(color: fgColor)),
      ),
    );
  }
}
