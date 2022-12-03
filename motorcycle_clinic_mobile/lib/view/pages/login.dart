import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/controller/request/login_request.dart';
import '/controller/login_controller.dart';
import 'moto_records.dart';

import '../widgets/logo.dart';
import '../widgets/app_bar_menu.dart';

class CuerpoLogin extends StatefulWidget {
  const CuerpoLogin({super.key});

  @override
  State<CuerpoLogin> createState() => _CuerpoLoginState();
}

class _CuerpoLoginState extends State<CuerpoLogin> {
  bool _isObscure = true;
  //
  final formKey = GlobalKey<FormState>();
  final _prefs = SharedPreferences.getInstance();

  //
  late final LoginController _controller = LoginController();
  late final LoginRequest _loginRequest = LoginRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEFAE0),
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Ingresar",
          style: TextStyle(fontSize: 22.0),
        )),
        backgroundColor: const Color(0xff4D581C),
        actions: const <Widget>[
          AppBMenu(),
        ],
      ),
      body: formLogin(context),
    );
  }

  Widget formLogin(BuildContext context) {
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
                        // const Text(
                        //   "También puedes loguearte con: ",
                        //   style: TextStyle(
                        //     fontSize: 16.0,
                        //     // fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 15.0,
                        // ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // botonFace(),
                            // botonGoogle(),
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

          if (!value.contains("@") || !value.contains(".")) {
            return "El correo tiene un formato invalido";
          }
          //Siempre pide retornar algo y pues null
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
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onSaved: (newValue) {
          _loginRequest.email = newValue!;
        },
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
          if (value.length < 6) {
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
        onSaved: (newValue) {
          _loginRequest.password = newValue!;
        },
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
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          //si es diferente a null se ejecuta.
          //save guarda todo los campos con onSaved
          formKey.currentState!.save();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
            "Validando usuario en base de datos",
          )));
          try {
            var msj = ScaffoldMessenger.of(context);
            var nav = Navigator.of(context);
            var userInfo = await _controller.validateLogin(_loginRequest);

            var pref = await _prefs;
            pref.setString("uid", userInfo.id!);
            pref.setString("name", userInfo.name!);
            pref.setString("lastName", userInfo.lastName!);
            pref.setString("email", userInfo.email!);
            pref.setBool("admin", userInfo.isAdmin!);

            nav.pop();
            nav.push(
              MaterialPageRoute(
                builder: (context) => const MotorcycleRecords(),
              ),
            );
            msj.showSnackBar(const SnackBar(
                content: Text(
              "Validación exitosa",
            )));
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                e.toString(),
              ),
            ));
          }
        }
      },
      child: const Text("Ingresar"),
    );
  }

  // Widget botonFace() {
  //   return IconButton(
  //     alignment: Alignment.center,
  //     padding: const EdgeInsets.only(bottom: 40.0),
  //     icon: const Icon(
  //       Icons.facebook,
  //       color: Colors.blueAccent,
  //       size: 65.0,
  //     ),
  //     onPressed: () {
  //       if (true) {
  //         //TODO: validar en BD
  //         var name = "name";
  //         Navigator.of(context).pop();
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) =>
  //                 Principal(email: _loginRequest.email, name: name),
  //           ),
  //         );
  //       }
  //     },
  //     // child: const Text("Ingresar"),
  //   );
  // }

  // Widget botonGoogle() {
  //   return ElevatedButton(
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: const Color.fromARGB(255, 220, 209, 209),
  //       textStyle: const TextStyle(fontSize: 25.0),
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(17.0),
  //       ),
  //       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 17.0),
  //     ),
  //     onPressed: () {
  //       //Aquí simulando
  //       var name = "name";
  //       if (true) {
  //         //TODO: validar en BD
  //         Navigator.of(context).pop();
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) =>
  //                 Principal(email: _loginRequest.email, name: name),
  //           ),
  //         );
  //       }
  //     },
  //     child: const Text("Google"),
  //   );
  // }

  Widget botonRegistro() {
    return TextButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 18.0),
      ),
      onPressed: () {
        if (true) {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MotorcycleRecords(),
            ),
          );
        }
      },
      child: const Text("¿No tienes cuenta? Registrate."),
    );
  }
}
