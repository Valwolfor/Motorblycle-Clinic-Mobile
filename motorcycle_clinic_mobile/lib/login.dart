import 'dart:ui';

import 'package:flutter/material.dart';

class CuerpoLogin extends StatefulWidget {
  const CuerpoLogin({super.key});

  @override
  State<CuerpoLogin> createState() => _CuerpoLoginState();
}

class _CuerpoLoginState extends State<CuerpoLogin> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Ingresar")),
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
      body: Container(
        color: const Color(0xffFEFAE0),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 2,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(90),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffBA5C0B),
                    spreadRadius: 0.2,
                    blurRadius: 10,
                    offset: Offset(0, .5),
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(1),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.png'),
                  radius: 70,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color(0xffBA5C0B),
                            ),
                            hintText: 'Usuario',
                            helperText: 'Usuario',
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffBA5C0B),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: TextField(
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xffBA5C0B),
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(
                                    _isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: const Color(0xffBA5C0B)),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            hintText: 'Contraseña',
                            helperText: 'Constraseña',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffBA5C0B),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff5DA767),
                          textStyle: const TextStyle(fontSize: 25.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60.0, vertical: 12.0),
                        ),
                        onPressed: () {},
                        child: const Text("Ingresar"),
                      ),
                      //TODO: ingreso con cuenta de google.
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
