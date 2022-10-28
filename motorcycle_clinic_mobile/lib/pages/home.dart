import 'package:flutter/material.dart';

import '/widgets/logo.dart';
import '/widgets/favoriteButton.dart';
import '/widgets/myDrawer.dart';
import '/widgets/iconsBar.dart';
import '/widgets/titleBar.dart';
import '/widgets/appBM.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEFAE0),
      appBar: AppBar(
        backgroundColor: const Color(0xff4D581C),
        title: const Center(
          child: Text(
            "Bienvenido",
            style: TextStyle(fontSize: 23.0),
          ),
        ),
        actions: const <Widget>[AppBMenu()],
      ),
      drawer: myDrawer(context),
      body: myBody(),
      bottomNavigationBar: const IconsBar(),
    );
  }
}

Widget myBody() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 2,
          ),
          //Imagen logo
          const Logo(),
          const Center(
            child: TitleBar(),
          ),
          const Center(
            child: StarButton(),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Expanded(
                  child: Text(
                    "Nuestra aplicación busca facilitar el registro de las ordenes de servicios que llevan los taller de mecánica, específicamente los de motocicletas. Con nuestra App podrás llevar registro de histórico de los ingresos de todos los vehículos que ingresan a tu taller, así como ver una historia clinica de todos los diagnósticos y los servicios prestados en las diferentes ocaciones. ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ),
          //barrita final
        ],
      ),
    ),
  );
}
