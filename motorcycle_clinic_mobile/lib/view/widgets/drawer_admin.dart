import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/home.dart';
import '../pages/moto_records.dart';
import '../pages/moto_register.dart';
import '/controller/login_controller.dart';

class DrawerAdmin extends StatefulWidget {
  const DrawerAdmin({super.key});

  @override
  State<DrawerAdmin> createState() => _DrawerAdminState();
}

class _DrawerAdminState extends State<DrawerAdmin> {
  final _prefs = SharedPreferences.getInstance();
  final _loginController = LoginController();
  late String _name = "";
  late String _lastName = "";
  late String _email = "";
  late bool _isAdmin = false;

  @override
  void initState() {
    super.initState();

//then para recibir el resultado.
    _prefs.then((prefs) {
      setState(() {
        _name = prefs.getString("name") ?? "N/A";
        _lastName = prefs.getString("lastName") ?? "N/A";
        _email = prefs.getString("email") ?? "N/A";
        _isAdmin = prefs.getBool("isAdmin") ?? false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final String fullName = "$_name $_lastName";
    return Drawer(
      backgroundColor: const Color(0xffFEFAE0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            drawerHeader(fullName, _email),

            if (_isAdmin)
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(
                  "Mecánicos",
                  style: TextStyle(fontSize: 18.0),
                ),
                onTap: () {
                  // Navigator.of(context).pop();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => null));
                },
              ),
            ListTile(
                leading: const Icon(Icons.app_registration_rounded),
                title: const Text(
                  "Motos en taller",
                  style: TextStyle(fontSize: 18.0),
                ),
                onTap: () {
                  // Navigator.of(context).pop();
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const Registro()),
                  // );
                }),
            ListTile(
                leading: const Icon(Icons.app_registration_rounded),
                title: const Text(
                  "Registrar moto",
                  style: TextStyle(fontSize: 18.0),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterMotorcycle(),
                    ),
                  );
                }),
            ListTile(
                leading: const Icon(Icons.app_registration_rounded),
                title: const Text(
                  "Histórico",
                  style: TextStyle(fontSize: 18.0),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MotorcycleRecords()),
                  );
                }),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(
                  "Cerrar sesión",
                  style: TextStyle(fontSize: 18.0),
                ),
                onTap: () async {
                  try {
                    var msj = ScaffoldMessenger.of(context);
                    var nav = Navigator.of(context);

                    _loginController.logout();

                    //Eliminar prefs.
                    var prefs = await _prefs;

                    prefs.clear();

                    msj.showSnackBar(
                      const SnackBar(
                        content: Text("La sesión se cerró correctamente"),
                      ),
                    );
                    nav.pop();
                    nav.push(
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  } catch (e) {
                    Future.error("No se pudo cerrar sesión");
                  }
                }),
            ListTile(
                title: const Text(
                  "App Versión 0.1.0",
                  style: TextStyle(fontSize: 16.0),
                ),
                onTap: () {
                  // Find peoples button action
                })
            //add more drawer menu here
          ],
        ),
      ),
    );
  }

  Widget drawerHeader(name, email) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: Color(0xff4D581C),
        // borderRadius: BorderRadius.all(
        //   Radius.circular(15.0),
        // ),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.person,
          size: 40.0,
          color: Colors.white70,
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white70,
          ),
        ),
        subtitle: Text(
          email,
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
