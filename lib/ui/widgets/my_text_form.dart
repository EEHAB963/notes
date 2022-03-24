import 'package:flutter/material.dart';

class MyTextForm extends StatelessWidget {
  MyTextForm({
    Key? key,
    required this.hint,
    required this.maxLain,
    this.onSave,
    this.mykey,
    this.value,
  }) : super(key: key);
  int? maxLain;
  String? hint;
  String? value = '';
  Function(String?)? onSave;
  GlobalKey<FormState>? mykey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: mykey,
        child: TextFormField(
          initialValue: value,
          maxLines: maxLain,
          expands: false,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 20),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
