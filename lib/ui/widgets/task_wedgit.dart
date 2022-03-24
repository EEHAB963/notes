import 'package:flutter/material.dart';

class TaskWedget extends StatelessWidget {
  TaskWedget(
      {Key? key, required this.value, required this.color, this.onChanged})
      : super(key: key);
  bool value;
  Function()? onChanged;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListTile(
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
          leading: InkWell(
            child: IconButton(
              onPressed: onChanged,
              icon: Icon(
                Icons.favorite,
                color: color,
              ),
            ),
          ),
          title: const Text(
            'task',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
