import 'package:flutter/material.dart';
import 'package:note/ui/build/biuld_task_widget.dart';

import '../build/biuld_floating_action_button_taska.dart';

class TaskTap extends StatelessWidget {
  const TaskTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BuildFlotonActionButonTask(),
      appBar: AppBar(
        elevation: 0,
        title: Column(
          children: const [
            Text(
              ' Tasker',
              style: TextStyle(fontSize: 35),
            ),
          ],
        ),
      ),
      body: const BiuldTaskWidget(),
    );
  }
}
