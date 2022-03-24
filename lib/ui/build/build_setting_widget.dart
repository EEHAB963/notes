import 'package:flutter/material.dart';


class BuildStengWidget extends StatelessWidget {
  const BuildStengWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.settings),
      ),
    );
  }
}
