import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note/modil/model_db.dart';
import 'package:note/provider/home_provider.dart';
import 'package:note/ui/screens/contant_note_note_screen.dart';
import 'package:provider/provider.dart';

class ItimWidgetList extends StatelessWidget {
  ItimWidgetList({
    Key? key,
    this.onDs,
    required this.modelDB,
    this.onTap,
    required this.numText,
    required this.text,
  }) : super(key: key);
  Function(DismissDirection)? onDs;
  String? text;

  ModelDB modelDB;
  Function()? onTap;

  int? numText;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDs,
      key: UniqueKey(),
      child: InkWell(
        onTap: () {
          onTap;
          Provider.of<HomeProvider>(context, listen: false).on = false;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContentScreen(
                  modelDB: modelDB,
                ),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Card(
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        numText!.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            text!,
                            style: const TextStyle(fontSize: 20),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
