import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:note/provider/home_provider.dart';
import 'package:note/provider/tap_provider.dart';
import 'package:note/provider/taske_provider.dart';
import 'package:note/ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  log("run app");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => TapProvider()),
        ChangeNotifierProvider(create: (context) => TaskeProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
