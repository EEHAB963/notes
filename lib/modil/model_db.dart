import 'package:note/modil/constans.dart';

class ModelDB {
  final int? id;
  final String? content;
  final String? address;
  const ModelDB({
    this.address,
    this.content,
    this.id,
  });

  ///dart to json
  Map<String, dynamic> toMap() => {
        columnID: id,
        columnaddress: address,
        columnContent: content,
      };

  ///json to dart
  factory ModelDB.fromMap(Map<String, dynamic> fromMap) {
    return ModelDB(
      id: fromMap[columnID],
      address: fromMap[columnaddress],
      content: fromMap[columnContent],
    );
  }
}
