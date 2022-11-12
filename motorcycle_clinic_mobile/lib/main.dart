import 'package:flutter/material.dart';

import 'view/pages/home.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Motorcycle Clinic App",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
