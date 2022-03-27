import 'package:flutter/material.dart';
import 'package:note/provider/taske_provider.dart';
import 'package:note/ui/screens/contant_task.dart';
import 'package:provider/provider.dart';

import '../../modil/model_task.dart';

class TaskWedget extends StatelessWidget {
  TaskWedget(
      {Key? key,
      required this.onChanged,
      required this.modelTask,
      this.onTap,
      this.id})
      : super(key: key);

  Function()? onChanged;
  Function()? onTap;
  int? id;

  ModelTask? modelTask;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<TaskeProvider>(context, listen: false).on = true;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ContantTask(
              modelTask: modelTask,
            ),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListTile(
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                Provider.of<TaskeProvider>(context, listen: false).delete(id!);
              },
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
