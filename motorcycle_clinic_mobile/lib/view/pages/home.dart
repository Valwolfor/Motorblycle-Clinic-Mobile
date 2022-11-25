import 'package:flutter/material.dart';

import '../widgets/logo.dart';
import '../widgets/favorite_button.dart';
import '../widgets/my_drawer.dart';
import '../widgets/icons_bar.dart';
import '../widgets/title_bar.dart';
import '../widgets/app_bar_menu.dart';

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
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 32.0,
              ),
              onPressed: () => Scaffold.of(context)
                  .openDrawer(), //función que llama al drawer.
            );
          },
        ),
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
          // Slider fotos
        ],
      ),
    ),
  );
}
