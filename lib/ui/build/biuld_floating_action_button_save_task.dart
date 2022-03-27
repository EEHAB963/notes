import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note/provider/taske_provider.dart';
import 'package:note/ui/screens/contant_task.dart';
import 'package:note/ui/widgets/floton_acshin_boton.dart';
import 'package:provider/provider.dart';

class BuildFlotonActionButonSaveTask extends StatelessWidget {
  BuildFlotonActionButonSaveTask({Key? key, this.index}) : super(key: key);
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
          provider.key.currentState!.save();
          if (provider.on == true) {
            log('updata');
            provider.updatData();
          } else {
            log('addData');
            provider.addData();
          }
          Navigator.pop(context);
        },
      );
    });
  }
}
