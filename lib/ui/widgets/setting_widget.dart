import 'package:flutter/material.dart';

class SettingWidget extends StatelessWidget {
  SettingWidget({Key? key}) : super(key: key);
  String? text;
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text!),
        TextField(
          decoration: InputDecoration(counterText: controller!.text),
          controller: controller,
        ),
      ],
    );
  }
}
