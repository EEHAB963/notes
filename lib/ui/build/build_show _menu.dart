import 'package:flutter/material.dart';
import 'package:note/provider/home_provider.dart';
import 'package:provider/provider.dart';

class ShowMenuBuild extends StatelessWidget {
  const ShowMenuBuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return InkWell(
            onTap: () {
              Provider.of<HomeProvider>(context, listen: false).to();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(provider.viwe == true ? Icons.list : Icons.gradient),
            ));
      },
    );
  }
}
