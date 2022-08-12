import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hintText;

  const InputField(
      {Key? key, required this.label, required this.controller, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        TextField(
          controller: controller,
          maxLines: 1,
          decoration: InputDecoration(hintText: 'hintText'),
        ),
      ],
    );
  }
}
