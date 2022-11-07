import 'package:flutter/material.dart';

import '/pages/principal.dart';
import '/pages/registro.dart';

import '/widgets/logo.dart';
import '/widgets/app_bar_menu.dart';

class CuerpoLogin extends StatefulWidget {
  const CuerpoLogin({super.key});

  @override
  State<CuerpoLogin> createState() => _CuerpoLoginState();
}

class _CuerpoLoginState extends State<CuerpoLogin> {
  bool _isObscure = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Ingresar",
          style: TextStyle(fontSize: 23.0),
        )),
        backgroundColor: const Color(0xff4D581C),
        actions: const <Widget>[
          AppBMenu(),
        ],
      ),
      body: formLogin(),
    );
  }

  Widget formLogin() {
    return Form(
      key: formKey, //para validar datos
      child: Container(
        color: const Color(0xffFEFAE0),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 2,
              ),
              const Logo(),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        mailField(),
                        passwordField(),
                        botonLogin(),
                        const SizedBox(
                          height: 15.0,
                        ),
                        const Text(
                          "También puedes loguearte con: ",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            botonFace(),
                            botonGoogle(),
                          ],
                        ),
                        botonRegistro(),
                        //TODO: ingreso con cuenta de google.
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mailField() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "El correo electronico es obligatorio";
          }
          if (value.contains("@") && value.contains(".")) {
            return "El correo tiene un formato invalido";
          }
          //no recuerdo pa que es el null, jaja.
          return null;
        },
        maxLength: 40,
        keyboardType: TextInputType.emailAddress,
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
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "La contraseña es obligatoria";
          }
          if (value.length > 6) {
            return "La constraseña debe tener mínimo seis caracteres";
          }
          return null; //por si no entra nada.
        },
        maxLength: 16,
        obscureText: _isObscure,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.lock,
            color: Color(0xffBA5C0B),
          ),
          suffixIcon: IconButton(
              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xffBA5C0B)),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              }),
          hintText: 'Contraseña',
          helperText: 'Constraseña',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffBA5C0B),
            ),
          ),
        ),
      ),
    );
  }

  Widget botonLogin() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff5DA767),
        textStyle: const TextStyle(fontSize: 25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 12.0),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          //TODO: validar en BD
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Principal(),
            ),
          );
        }
      },
      child: const Text("Ingresar"),
    );
  }

  Widget botonFace() {
    return IconButton(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(0.0),
      icon: const Icon(
        Icons.facebook,
        color: Colors.blueAccent,
        size: 60.0,
      ),
      onPressed: () {
        if (true) {
          //TODO: validar en BD
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Principal(),
            ),
          );
        }
      },
      // child: const Text("Ingresar"),
    );
  }

  Widget botonGoogle() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 220, 209, 209),
        textStyle: const TextStyle(fontSize: 25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 17.0),
      ),
      onPressed: () {
        if (true) {
          //TODO: validar en BD
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Principal(),
            ),
          );
        }
      },
      child: const Text("Google"),
    );
  }

  Widget botonRegistro() {
    return TextButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 18.0),
      ),
      onPressed: () {
        if (true) {
          //TODO: validar en BD
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Registro(),
            ),
          );
        }
      },
      child: const Text("¿No tienes cuenta? Registrate."),
    );
  }
}
