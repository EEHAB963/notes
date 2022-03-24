import 'package:flutter/material.dart';
import 'package:note/provider/home_provider.dart';
import 'package:note/ui/widgets/floton_acshin_boton.dart';
import 'package:provider/provider.dart';

class BuildFlotonActionButonSave extends StatelessWidget {
  BuildFlotonActionButonSave({Key? key, this.index}) : super(key: key);
  int? index;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return FloatingActionButtonWidget(
        widget: const Center(
            child: Text(
          'Save',
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
        onTap: () {
          provider.key.currentState?.save();
          print(provider.vaiueText);
          print(provider.on);

          if (provider.on == true) {
            print('add');
            provider.addData();

            Navigator.pop(context);
          } else {
            print('updat');
            provider.updatData();

            Navigator.pop(context);
          }
        },
      );
    });
  }
}
