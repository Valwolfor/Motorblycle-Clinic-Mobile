import 'package:flutter/material.dart';

import '/controller/register_controller.dart';
import '/controller/request/register_request.dart';
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

  late final RegisterController _controller = RegisterController();
  late final RegisterRequest _registerRequest = RegisterRequest();

  //verificar contraseñas
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  // late RegisterController _controller = RegisterController();
  // late RegisterRequest _loginRequest = LogiRegisterRequestnRequest();

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
            style: TextStyle(fontSize: 22.0),
          ),
        ),
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
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.center,
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
        onSaved: (newValue) {
          _registerRequest.name = newValue!;
        },
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
        onSaved: (newValue) {
          _registerRequest.lastName = newValue!;
        },
      ),
    );
  }

  Widget numberField() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Por favor ingrese un número de contacto.";
          }
          return null;
        },
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
        onSaved: (newValue) {
          _registerRequest.phoneNumber = newValue!;
        },
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
          if (!value.contains("@") && !value.contains(".")) {
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
        onSaved: (newValue) {
          _registerRequest.email = newValue!;
        },
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
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffBA5C0B),
            ),
          ),
        ),
        onSaved: (newValue) {
          _registerRequest.password = newValue!;
        },
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
          if (value.length < 6) {
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
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          //validación en BD
          formKey.currentState!.save();
          //cómo promese, usando el then, sí es existoso envía lo siguiente
          try {
            var msj = ScaffoldMessenger.of(context);
            var nav = Navigator.of(context);
            await _controller.registerNewUser(_registerRequest);

            msj.showSnackBar(
              const SnackBar(
                content: Text("El registro fue exitoso"),
              ),
            );
            //envía al login para iniciar de una vez.
            nav.pop();
            nav.push(
              MaterialPageRoute(
                builder: (context) => const CuerpoLogin(),
              ),
            );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.toString()),
              ),
            );
          }
        }
      },
      child: const Text("Registrarse"),
    );
  }
}
