import 'package:flutter/material.dart';
import 'package:note/modil/model_task.dart';
import 'package:note/provider/db_task_provider.dart';

class TaskeProvider extends ChangeNotifier {
  List<ModelTask> dataTask = [];
  bool isDan = true;
  String? tasks = 'hh';
  int? id;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  bool on = true;

  bool checkbox = false;
  valueCheckbox() {
    checkbox = !checkbox;
    print('checbox provider// $checkbox');
    notifyListeners();
  }

  Future<List<ModelTask>> getData() async {
    dataTask = await DbTaskProvider.instanceTAsk.ReadDataAll();

    return dataTask.isEmpty ? [] : dataTask;
  }

  addData() {
    DbTaskProvider.instanceTAsk.cerateUser(
      ModelTask(
        inte: isDan,
        content: tasks,
      ),
    );
    notifyListeners();
  }

  updatData() {
    print('upDataTasks');

    DbTaskProvider.instanceTAsk.updareUser(
      ModelTask(
        inte: isDan,
        content: tasks,
        id: dataTask[id!].id!,
      ),
    );
    notifyListeners();
  }

  delete(int id) {
    DbTaskProvider.instanceTAsk.delete(dataTask[id].id!);
    notifyListeners();
  }
}
