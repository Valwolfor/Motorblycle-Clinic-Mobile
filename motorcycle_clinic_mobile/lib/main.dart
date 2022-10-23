import 'package:flutter/material.dart';

void main(List<String> args) {
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

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Bienvenido"),
        ),
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
      drawer: myDrawer(),
      body: myBody(),
    );
  }
}

Widget myBody() {
  return Container(
    color: const Color(0xffFEFAE0),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: <Widget>[
        const SizedBox(
          height: 2,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
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
        Center(
          child: FractionallySizedBox(
            widthFactor: .70,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xffBA5C0B),
                border: Border.all(
                  width: 1,
                  color: const Color(0x44EEA15E),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(
                        10.0) //                 <--- border radius here
                    ),
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  // ignore: prefer_const_constructors
                  BoxShadow(
                    color: const Color(0xffEEA15E),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, .5),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "Motorcycle Clinic App",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                          "Nuestros clientes siempre obtienen la mejor calidad"),
                    ),
                  ],
                ),
                // ignore: todo
                //TODO: dinamico.
              ),
              Padding(
                padding: const EdgeInsets.all(1),
                child: Column(
                  children: const <Widget>[
                    Icon(Icons.star_border),
                    Text("41"),
                  ],
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Expanded(
                child: Text(
                  "Nuestra aplicación busca facilitar el registro de las ordenes de servicios que llevan los taller de mecánica, específicamente los de motocicletas. Con nuestra App podrás llevar registro de histórico de los ingresos de todos los vehículos que ingresan a tu taller, así como ver una historia clinica de todos los diagnósticos y los servicios prestados en las diferentes ocaciones. ",
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            decoration: const BoxDecoration(
              color: Color(0xffEEA15E),
              borderRadius: BorderRadius.all(Radius.circular(
                      10.0) //                 <--- border radius here
                  ),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                // ignore: prefer_const_constructors
                BoxShadow(
                  color: Color(0xffEEA15E),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, .5),
                ),
              ],
            ),
            margin: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  children: const <Widget>[
                    Icon(Icons.phone),
                    Text("Llamanos"),
                  ],
                ),
                Column(
                  children: const <Widget>[
                    Icon(Icons.motorcycle),
                    Text("Unete"),
                  ],
                ),
                Column(
                  children: const <Widget>[
                    Icon(Icons.share),
                    Text("Compartir"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

/// Menú izquierdo
Widget myDrawer() {
  return Drawer(
    backgroundColor: const Color(0xffFEFAE0),
    child: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Ingresar"),
                onTap: () {
                  // My Pfofile button action
                }),
            ListTile(
                leading: const Icon(Icons.app_registration_rounded),
                title: const Text("Registrame"),
                onTap: () {
                  // Find peoples button action
                }),
            ListTile(
                title: const Text("App Versión 0.1.0"),
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
