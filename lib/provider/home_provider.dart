import 'package:flutter/material.dart';
import 'package:note/modil/model_db.dart';
import 'package:note/provider/db_provider.dart';

class HomeProvider extends ChangeNotifier {
  List<ModelDB> data = [];

  bool on = true;
  int? id;
  String? vaiueText;
  String? vaiueTitel;

  bool viwe = true;
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  Future<List<ModelDB>> getData() async {
    data = await DBprovider.instance.ReadDataAll();

    return data.isEmpty ? [] : data;
  }

  void to() {
    viwe = !viwe;
    notifyListeners();
  }

  notifyListeners();

  addData() {
    DBprovider.instance.cerateUser(
      ModelDB(
        address: vaiueTitel,
        content: vaiueText,
      ),
    );
    notifyListeners();
  }

  updatData() {
    print('index=$id');
    print('index=${data[id!].id}');
    DBprovider.instance.updareUser(
      ModelDB(
        address: vaiueTitel,
        content: vaiueText,
        id: data[id!].id!,
      ),
    );
    notifyListeners();
  }

  delete(int id) {
    DBprovider.instance.delete(data[id].id!);
    notifyListeners();
  }
}
