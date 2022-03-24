import 'package:flutter/material.dart';
import 'package:note/ui/build/build_floating_action_button_widget.dart';
import 'package:note/ui/build/build_item_widget.dart';
import 'package:note/ui/build/build_setting_widget.dart';
import 'package:note/ui/build/build_show%20_menu.dart';

class NoteTap extends StatelessWidget {
  const NoteTap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BuildFloatingActionButtonWidget(),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          ShowMenuBuild(),
        ],
        title: const Text('My Note'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: BuildItemWidget(),
      ),
    );
  }
}
