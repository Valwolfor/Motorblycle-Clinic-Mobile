import 'package:flutter/material.dart';

import '../pages/registro.dart';

class IconsBar extends StatefulWidget {
  const IconsBar({super.key});

  @override
  State<IconsBar> createState() => _IconsBarState();
}

//TODO: Volver botones y darles funcionalidad.
class _IconsBarState extends State<IconsBar> {
  final Uri _url = Uri.parse(
      'https://api.whatsapp.com/send/?phone=573108796935&text&type=phone_number&app_absent=0');
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(90),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black87,
            blurRadius: 7.0,
            spreadRadius: 0.1,
            offset: Offset(0, .5),
          ),
        ],
      ),
      margin: const EdgeInsets.all(6.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(35.0),
        ),
        child: BottomAppBar(
          color: const Color(0xff4D581C),
          shape: const CircularNotchedRectangle(),
          elevation: 20.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.phone),
                    color: Colors.white,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                        //flutter pub add url_launcher
                        "Próximante dispondrás de está funcionalidad",
                      )));
                    },
                  ),
                  const Text(
                    "Llamanos",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.motorcycle_rounded),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Registro(),
                          ),
                        );
                      },
                    ),
                    const Text(
                      "Unete",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.share),
                    color: Colors.white,
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                        "Próximante dispondrás de está funcionalidad",
                      )));
                    },
                  ),
                  const Text(
                    "Compartir",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
