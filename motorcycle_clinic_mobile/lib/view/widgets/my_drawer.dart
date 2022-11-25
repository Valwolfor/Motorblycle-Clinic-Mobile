import 'package:flutter/material.dart';

import '../pages/login.dart';
import '../pages/registro.dart';

/// Menú izquierdo para home con ingreso y registro
Widget myDrawer(context) {
  return Drawer(
    backgroundColor: const Color(0xffFEFAE0),
    child: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 60),
        child: Column(
          children: <Widget>[
            ListTile(
                leading: const Icon(Icons.person),
                title: const Text(
                  "Ingresar",
                  style: TextStyle(fontSize: 18.0),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CuerpoLogin()));
                }),
            ListTile(
                leading: const Icon(Icons.app_registration_rounded),
                title: const Text(
                  "Registrame",
                  style: TextStyle(fontSize: 18.0),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Registro()));
                }),
            ListTile(
                title: const Text(
                  "App Versión 0.5.0",
                  style: TextStyle(fontSize: 16.0),
                ),
                onTap: () {
                  // Find peoples button action
                })
            //add more drawer menu here
          ],
        ),
      ),
    ),
  );
}
