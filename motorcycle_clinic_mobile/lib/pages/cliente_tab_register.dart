import 'package:flutter/material.dart';

class ViewCliente extends StatefulWidget {
  const ViewCliente({super.key});

  @override
  State<ViewCliente> createState() => _ViewClienteState();
}

class _ViewClienteState extends State<ViewCliente> {
  var _selectedValue = "CC";
  final _documents = <String>[
    "CC",
    "TI",
    "PP",
    "CE",
  ];

  final formKeyCustomer = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 15.0,
      ),
      child: Column(
        children: <Widget>[
          const Center(
            child: Text(
              "Por favor ingrese los datos de cliente. Si el cliente ya está registrado, por favor validar.",
              style: TextStyle(fontSize: 22.0),
              textAlign: TextAlign.center,
            ),
          ),
          formCliente(),
        ],
      ),
    );
  }

  //Tab de cliente.
  Widget formCliente() {
    return Form(
      key: formKeyCustomer,
      // autovalidateMode: AutovalidateMode.disabled,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                dropdownID(),
                const SizedBox(
                  width: 5.0,
                ),
                idCLienteField(),
                iconButtonID(),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                children: [
                  nameClienteField(),
                  const SizedBox(
                    width: 5.0,
                  ),
                  lastNameClientefield(),
                ],
              ),
            ),
            mailClienteField(),
            numberClienteField(),
            botonCliente()
          ],
        ),
      ),
    );
  }

  Widget dropdownID() {
    return Expanded(
      child: DropdownButtonFormField(
        //Quitar tipo widget
        borderRadius: BorderRadius.circular(20.0),
        dropdownColor: const Color(0xffFEFAE0),
        decoration: InputDecoration(
          //TODO:  aquí falla cada vez que se seleciona
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Color(0xffBA5C0B),
            ),
          ),
        ),
        value: _selectedValue,
        items: _documents
            .map<DropdownMenuItem>((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: (value) {
          setState(
            () {
              _selectedValue = value as String;
            },
          );
        },
      ),
    );
  }

  Widget iconButtonID() {
    return Expanded(
      child: IconButton(
        onPressed: () {
          if (formKeyCustomer.currentState!.validate()) {
            //TODO: validar id en BD
            Navigator.of(context).pop();
          }
        },
        icon: const Icon(
          Icons.search_rounded,
          color: Color(0xffBA5C0B),
          size: 45.0,
        ),
      ),
    );
  }

  Widget idCLienteField() {
    return Expanded(
      flex: 2,
      child: TextFormField(
        //se pone azul al selecionarlo
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Indique el número de documento";
          }
          if (value.contains(".")) {
            return "Ingrese el número sin puntos";
          }
          //no recuerdo pa que es el null, jaja.
          return null;
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          // prefixIcon: const Icon(
          //   Icons.document_scanner,
          //   color: Color(0xffBA5C0B),
          // ),
          label: const Text(
            'Número de documento',
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffBA5C0B),
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(color: Color(0xffBA5C0B))),
        ),
      ),
    );
  }

  Widget nameClienteField() {
    return Expanded(
      child: TextFormField(
        //se pone azul al selecionarlo
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Ingrese el nombre";
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.person,
            color: Color(0xffBA5C0B),
          ),
          label: const Text(
            'Nombre',
          ),
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

  Widget lastNameClientefield() {
    return Expanded(
      child: TextFormField(
        //se pone azul al selecionarlo
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Ingrese apellido(s)";
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.person,
            color: Color(0xffBA5C0B),
          ),
          label: const Text(
            'Apellido(s)',
          ),
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

  Widget mailClienteField() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
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
            Icons.mail,
            color: Color(0xffBA5C0B),
          ),
          hintText: 'Correo electrónico',
          helperText: 'Correo electrónico',
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

  Widget numberClienteField() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Ingrese el número de contacto";
          }
          if (value.length != 10) {
            return "El número celular por favor, sin idicativos";
          }
          //no recuerdo pa que es el null, jaja.
          return null;
        },
        maxLength: 10,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.phone_android,
            color: Color(0xffBA5C0B),
          ),
          hintText: 'Número celular',
          helperText: 'Número de contacto',
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

  Widget botonCliente() {
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
        if (formKeyCustomer.currentState!.validate()) {
          //TODO: validar en BD
          Navigator.of(context).pop();
        }
      },
      child: const Text("Regisrar"),
    );
  }
}
