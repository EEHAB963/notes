import 'package:flutter/material.dart';
import 'package:note/modil/model_db.dart';
import 'package:note/provider/home_provider.dart';
import 'package:note/ui/build/biuld_floton_action_button_widget_save.dart';
import 'package:provider/provider.dart';

class ContentScreen extends StatelessWidget {
  ContentScreen({Key? key, this.modelDB}) : super(key: key);
  ModelDB? modelDB;
  String text = '';
  String titil = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          floatingActionButton: BuildFlotonActionButonSave(),
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Form(
              key: provider.key,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // titil wedgit

                    TextFormField(
                      initialValue: provider.on == true ? "" : modelDB!.address,
                      maxLines: 2,
                      expands: false,
                      decoration: const InputDecoration(
                        hintText: 'Titil',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        border: InputBorder.none,
                      ),
                      onSaved: (newValue) {
                        provider.vaiueTitel = newValue;
                        print('onSave titel don');
                      },
                    ),

                    //tixt wedgit

                    TextFormField(
                      initialValue: provider.on == true ? "" : modelDB!.content,
                      maxLines: 100,
                      expands: false,
                      decoration: const InputDecoration(
                        hintText: 'Text',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                        border: InputBorder.none,
                      ),
                      onSaved: (newValue) {
                        provider.vaiueText = newValue;
                        print('onSave text don');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
