import 'dart:math';
import 'package:flutter/material.dart';
import 'package:note/modil/model_db.dart';
import 'package:note/provider/home_provider.dart';
import 'package:note/ui/screens/contant_note_note_screen.dart';
import 'package:provider/provider.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({
    Key? key,
    this.onDs,
    required this.modelDB,
    this.onTap,
    required this.numText,
    this.id,
    required this.text,
  }) : super(key: key);

  Function(DismissDirection)? onDs;
  String? text;
  int? id;

  ModelDB modelDB;
  Function()? onTap;

  int? numText;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.horizontal,
      onDismissed: onDs,
      child: InkWell(
        onTap: () {
          onTap;
          Provider.of<HomeProvider>(context, listen: false).on = false;
          Provider.of<HomeProvider>(context, listen: false).id = id;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContentScreen(
                  modelDB: modelDB,
                ),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
                  .shade400,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.grey, blurRadius: 9, spreadRadius: 1),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(numText.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    text!,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
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
