import 'package:flutter/material.dart';
import 'package:note/provider/home_provider.dart';
import 'package:note/ui/screens/contant_note_note_screen.dart';
import 'package:note/ui/widgets/floton_acshin_boton.dart';
import 'package:provider/provider.dart';

class BuildFloatingActionButtonWidget extends StatelessWidget {
  const BuildFloatingActionButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return FloatingActionButtonWidget(
        widget: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onTap: () {
          provider.on = true;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ContentScreen(),
            ),
          );
        },
      );
    });
  }
}
