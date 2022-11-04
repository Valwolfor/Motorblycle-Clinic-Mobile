import 'package:flutter/material.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Registro",
            style: TextStyle(fontSize: 23.0),
          ),
        ),

        //TODO: aquí vamos mañana sigo esto
        backgroundColor: const Color(0xff4D581C),
        actions: <Widget>[
          PopupMenuButton<Text>(
            color: const Color(0xffFEFAE0),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Text(
                    "Configuración",
                  ),
                ),
                const PopupMenuItem(
                  child: Text(
                    "Danos tu opinión",
                  ),
                ),
                const PopupMenuItem(
                  child: Text(
                    "Ayuda",
                  ),
                ),
                const PopupMenuItem(
                  child: Text(
                    "Acerca de nosotros",
                  ),
                )
              ];
            },
          ),
        ],
      ),
    );
  }
}
