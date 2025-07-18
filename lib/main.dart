import 'package:dark_cred/core/theme/dart_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drx Events',
      theme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: const Scaffold( body: Center(child: Text('hello'),),),
    );
  }
}

