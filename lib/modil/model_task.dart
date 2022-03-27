import 'package:note/modil/constans.dart';

class ModelTask {
  final int? id;
  final String? content;
  final bool? inte;

  const ModelTask({this.content, this.id, this.inte});

  ///dart to json
  Map<String, dynamic> toMap() => {
        columnTaskID: id,
        //columnTaskInt: inte,
        columnTaskContent: content,
      };

  ///json to dart
  factory ModelTask.fromMap(Map<String, dynamic> fromMap) {
    return ModelTask(
      id: fromMap[columnTaskID],
      //inte: fromMap[columnTaskInt],
      content: fromMap[columnTaskContent],
    );
  }
}
