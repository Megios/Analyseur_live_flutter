import 'package:flutter/material.dart';
import 'package:flutter_live_appplication_analyse/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Analyseur texte',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const HomePage());
  }
}
