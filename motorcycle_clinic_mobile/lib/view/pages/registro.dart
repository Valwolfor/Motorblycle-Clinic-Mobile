import 'package:flutter/material.dart';

import '../widgets/logo.dart';
import '../widgets/app_bar_menu.dart';
import 'login.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  bool _isObscure = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Registro",
            style: TextStyle(fontSize: 23.0),
          ),
        ),

        //TODO: aquí vamos mañana sigo esto
        backgroundColor: const Color(0xff4D581C),
        actions: const <Widget>[
          AppBMenu(),
        ],
      ),
      body: formRegister(),
    );
  }

  Widget formRegister() {
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
                        const Text(
                          "Diligencie los siguientes campos para crear su usuario",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),
                        nameField(),
                        lastNameField(),
                        numberField(),
                        mailField(),
                        passwordField(),
                        passwordFieldConfirm(),
                        botonRegistar(),
                        const SizedBox(height: 40.0),
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

  Widget nameField() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Por favor ingrese su nombre";
          }
          //no recuerdo pa que es el null, jaja.
          return null;
        },
        maxLength: 50,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: 'Nombre',
          helperText: 'Nombre',
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
    );
  }

  Widget lastNameField() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Por favor ingrese su apellido(s)";
          }
          //no recuerdo pa que es el null, jaja.
          return null;
        },
        maxLength: 50,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: 'Apellido',
          helperText: 'Apellido',
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
    );
  }

  Widget numberField() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        maxLength: 10,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.phone,
            color: Color(0xffBA5C0B),
          ),
          hintText: 'Número de celular sin espacios',
          helperText: 'Celular',
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
          hintText: 'Usuario@correo.com',
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
    );
  }

  Widget passwordField() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        controller: passwordController,
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
            borderRadius: BorderRadius.circular(10),
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

  Widget passwordFieldConfirm() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        controller: passwordConfirmationController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "La contraseña es obligatoria";
          }
          if (value.length > 6) {
            return "La constraseña debe tener mínimo seis caracteres";
          }
          if (passwordController.text != passwordConfirmationController.text) {
            return "Las constraseña deben coincidir";
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
          hintText: 'Confirmación de contraseña',
          helperText: 'Confirmación de constraseña',
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
    );
  }

  Widget botonRegistar() {
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
              builder: (context) => const CuerpoLogin(),
            ),
          );
        }
      },
      child: const Text("Registrarse"),
    );
  }
}
