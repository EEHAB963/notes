import 'package:flutter/material.dart';
import 'package:note/provider/tap_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TapProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: provider.listScreens[provider.index],
        bottomNavigationBar: BottomNavigationBar(
          items: provider.listBottomNavigationBarItem,
          currentIndex: provider.index,
          onTap: (index) {
            provider.changeIndex(index);
            print(index);
          },
          type: BottomNavigationBarType.fixed,
        ),
      );
    });
  }
}
