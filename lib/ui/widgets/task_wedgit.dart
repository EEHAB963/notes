import 'package:flutter/material.dart';

import '../../modil/model_task.dart';

class TaskWedget extends StatelessWidget {
  TaskWedget(
      {Key? key, required this.onChanged, required this.modelTask, this.onTap})
      : super(key: key);

  Function()? onChanged;
  Function()? onTap;

  ModelTask? modelTask;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
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
                  modelTask!.inte == true
                      ? Icons.check_box_outline_blank
                      : Icons.done,
                  color: modelTask!.inte == true ? Colors.grey : Colors.blue,
                ),
              ),
            ),
            title: Text(
              modelTask!.content!,
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
