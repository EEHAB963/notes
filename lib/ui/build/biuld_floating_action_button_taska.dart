import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/taske_provider.dart';
import '../screens/contant_task.dart';
import '../widgets/floton_acshin_boton.dart';

class BuildFlotonActionButonTask extends StatelessWidget {
  BuildFlotonActionButonTask({Key? key, this.index}) : super(key: key);
  int? index;
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskeProvider>(builder: (context, provider, child) {
      return FloatingActionButtonWidget(
        widget: const Center(
            child: Text(
          'add',
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
        onTap: () {
          provider.on = false;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContantTask(),
              ));
        },
      );
    });
  }
}
