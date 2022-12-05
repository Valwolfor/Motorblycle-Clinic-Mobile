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
      iconSize: 30.0,
      color: const Color(0xffFEFAE0),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Configuración"),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    "Próximante dispondrás de está funcionalidad",
                  )));
                }),
          ),
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.message_rounded),
              title: const Text("Danos tu opinión"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                  "Próximante podrás darnos tu valiosa opinión por este medio, por ahora puedes escribirnos directamente.",
                )));
              },
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.help),
              title: const Text("Ayuda"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                  "Próximante dispondrás de está funcionalidad",
                )));
              },
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              leading: const Icon(Icons.group),
              title: const Text("Acerca de nosotros"),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                  "Pronto dispondremos de nuestro sitio para que puedar obtener la información que necesitas",
                )));
              },
            ),
          )
        ];
      },
    );
  }
}
