import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? widget;

  const FloatingActionButtonWidget({Key? key, this.onTap, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black38,
        ),
        child: widget,
      ),
    );
  }
}
