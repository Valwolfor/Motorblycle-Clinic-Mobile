import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'view/pages/moto_register.dart';

void main() async {
  //este es por un error porque inicia antes de que pase la ejecución del run App
  WidgetsFlutterBinding.ensureInitialized();
  //para conectar a Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MotorClinic());
}

class MotorClinic extends StatefulWidget {
  const MotorClinic({super.key});

  @override
  State<MotorClinic> createState() => _MotorClinicState();
}

class _MotorClinicState extends State<MotorClinic> {
  final _prefs = SharedPreferences.getInstance();
  Widget _init = Home();

  @override
  void initState() {
    super.initState();
    _prefs.then((pref) {
      if (pref.getString("uid") != null) {
        setState(() {
          _init = const RegisterMotorcycle();
          //se puede poner pantalla de carga.
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //quitar teclado
        final FocusScopeNode focus = FocusScope.of(context);

        if (!focus.hasPrimaryFocus && focus.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp(
        title: "Motorcycle Clinic App",
        debugShowCheckedModeBanner: false,
        home: _init,
      ),
    );
  }
}
