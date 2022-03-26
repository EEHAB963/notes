import 'package:flutter/material.dart';
import 'package:note/modil/model_task.dart';
import 'package:note/provider/taske_provider.dart';
import 'package:note/ui/build/biuld_floating_action_button_save_task.dart';
import 'package:provider/provider.dart';

class ContantTask extends StatelessWidget {
  ContantTask({Key? key, this.modelTask})
      : super(
          key: key,
        );
  ModelTask? modelTask;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          floatingActionButton: BuildFlotonActionButonSaveTask(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                Text('What is the task?'),
                TextFormField(),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                    leading: Text('What is the task?'),
                    title: provider.on == false
                        ? IconButton(
                            onPressed: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2022),
                                      lastDate: DateTime(2040))
                                  .then((value) {
                                print(value);
                                // Provider.of<TaskeProvider>(context).
                              });
                            },
                            icon: Icon(Icons.history))
                        : Text('2345')),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                    leading: Text('What is the task?'),
                    title: provider.on == false
                        ? IconButton(
                            onPressed: () {
                              showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now());
                            },
                            icon: Icon(Icons.timelapse))
                        : Text('2345')),
              ],
            ),
          ),
        );
      },
    );
  }
}
