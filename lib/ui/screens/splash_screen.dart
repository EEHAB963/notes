import 'package:flutter/material.dart';
import 'package:note/ui/screens/home_screen.dart';

class SplashScrren extends StatelessWidget {
  const SplashScrren({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
    return Container();
  }
}
