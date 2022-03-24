import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note/provider/taske_provider.dart';
import 'package:note/ui/screens/contant_task.dart';
import 'package:note/ui/widgets/floton_acshin_boton.dart';
import 'package:provider/provider.dart';

class BuildFlotonActionButonTask extends StatelessWidget {
  BuildFlotonActionButonTask({Key? key, this.index}) : super(key: key);
  int? index;
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskeProvider>(builder: (context, provider, child) {
      return FloatingActionButtonWidget(
        widget: const Center(
            child: Text(
          'Save',
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
        onTap: () {
          if (provider.on == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContantTask(),
              ),
            );
            provider.key.currentState?.save();
            log(provider.tasks.toString());
            print(provider.on);

            if (provider.on == true) {
              print('add');
              provider.addData();

              Navigator.pop(context);
            } else {
              print('update');

              provider.updatData();

              Navigator.pop(context);
            }

            //bag if
          } else {
            provider.key.currentState?.save();
            print(provider.tasks);
            print(provider.on);

            if (provider.on == true) {
              print('add');
              provider.addData();

              Navigator.pop(context);
            } else {
              print('update');

              provider.updatData();

              Navigator.pop(context);
            }
          } //bag else
        },
      );
    });
  }
}
