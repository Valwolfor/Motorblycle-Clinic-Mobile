import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '/pages/registro.dart';

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
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
        decoration: const BoxDecoration(
          color: Color(0xffEEA15E),
          borderRadius: BorderRadius.all(
              Radius.circular(10.0) //                 <--- border radius here
              ),
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            // ignore: prefer_const_constructors
            BoxShadow(
              color: Color(0xffEEA15E),
              spreadRadius: 1.0,
              blurRadius: 4.0,
              offset: Offset(0, .5),
            ),
          ],
        ),
        margin: const EdgeInsets.only(
          top: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.phone),
                  onPressed: () {
                    lauch(_url);
                  },
                ),
                const Text(
                  "Llamanos",
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.motorcycle_rounded),
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
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            Column(
              children: const <Widget>[
                Icon(Icons.share),
                Text(
                  "Compartir",
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
