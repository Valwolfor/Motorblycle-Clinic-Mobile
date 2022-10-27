import 'package:flutter/material.dart';

///Tiene menú de navegación y menú de asistencia.
class AppBMenu extends StatefulWidget {
  const AppBMenu({super.key});

  @override
  State<AppBMenu> createState() => _AppBMenuState();
}

class _AppBMenuState extends State<AppBMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Text>(
      color: const Color(0xffFEFAE0),
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("Configuración"),
              //Puede llevar onTap para darle las opciones.
            ),
          ),
          const PopupMenuItem(
            child: ListTile(
              leading: Icon(Icons.message_rounded),
              title: Text("Danos tu opinión"),
            ),
          ),
          const PopupMenuItem(
            child: ListTile(
              leading: Icon(Icons.help),
              title: Text("Ayuda"),
            ),
          ),
          const PopupMenuItem(
            child: ListTile(
              leading: Icon(Icons.group),
              title: Text("Acerca de nosotros"),
            ),
          )
        ];
      },
    );
  }
}
