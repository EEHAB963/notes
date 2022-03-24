import 'package:flutter/material.dart';
import 'package:note/ui/screens/note_tap.dart';
import 'package:note/ui/screens/settings_tap.dart';
import 'package:note/ui/screens/task_tap.dart';

class TapProvider extends ChangeNotifier {
  int index = 0;
  List<Widget> listScreens = [
    const TaskTap(),
    const NoteTap(),
    const SettingsTap(),
  ];
  final List<BottomNavigationBarItem> listBottomNavigationBarItem = [
    const BottomNavigationBarItem(icon: Icon(Icons.task), label: 'TASK'),
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'NOTE'),
  ];
  void changeIndex(int index) {
    this.index = index;
    print('index=$index');
    notifyListeners();
  }
}
