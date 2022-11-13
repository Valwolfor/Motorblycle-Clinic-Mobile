import 'package:flutter/material.dart';

import 'view/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

void main() async {
  //este es por un error porque inicia antes de que pase la ejecución del run App
  WidgetsFlutterBinding.ensureInitialized();
  //para conectar a Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
