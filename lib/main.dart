import 'package:flutter/material.dart';
import 'package:rest_apis_project/home_screen_with_self_model.dart';
import 'package:rest_apis_project/home_screen.dart';

import 'home_screen_without_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomeScreenWithoutModel(),
    );
  }
}

