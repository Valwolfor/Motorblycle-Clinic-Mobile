import 'package:flutter/material.dart';

import '/model/entity/motorcycle.dart';
import '/controller/service_order_controller.dart';

class ViewMoto extends StatefulWidget {
  const ViewMoto({super.key});

  @override
  State<ViewMoto> createState() => _ViewMotoState();
}

class _ViewMotoState extends State<ViewMoto> {
  final formKeyMotocycle = GlobalKey<FormState>();

  late final ServiceOrderController _controller = ServiceOrderController();
  late final MotorcycleEntity _motorcycle = MotorcycleEntity();

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
              "Por favor ingrese los datos de la moto. Si ya está registrada, validela.",
              style: TextStyle(fontSize: 22.0),
              textAlign: TextAlign.center,
            ),
          ),
          formMoto(),
        ],
      ),
    );
  }

//Tab moto
  Widget formMoto() {
    return Form(
      key: formKeyMotocycle,
      // autovalidateMode: AutovalidateMode.disabled,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                idMotoField(),
                const SizedBox(
                  width: 5.0,
                ),
                iconButtonPlaca(),
              ],
            ),
            idMotorField(),
            idChasisField(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                children: [
                  brandField(),
                  const SizedBox(
                    width: 5.0,
                  ),
                  modelField(),
                ],
              ),
            ),
            yearRecordField(),
            botonMoto(),
            //TODO: tarjeta con datos del usuario
          ],
        ),
      ),
    );
  }

  Widget idMotoField() {
    return Expanded(
      flex: 2,
      child: TextFormField(
        //TODO: convertir mayúsculas, también motor y chasis
        //se pone azul al selecionarlo
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Indique la placa del vehículo";
          }
          if (value.contains(".") || value.contains(" ")) {
            return "Ingrese el número sin puntos o espacios";
          }
          if (value.length != 6) {
            return "La placa es incorrecta";
          }
          //no recuerdo pa que es el null, jaja.
          return null;
        },
        maxLength: 6,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.motorcycle,
            color: Color(0xffBA5C0B),
          ),
          label: const Text(
            'Placa de la moto',
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
        onSaved: (newValue) {
          _motorcycle.plate = newValue!;
        },
      ),
    );
  }

  Widget iconButtonPlaca() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(bottom: 35.0),
        child: IconButton(
          onPressed: () {
            //TODO: solo validar placa
            if (formKeyMotocycle.currentState!.validate()) {
              //TODO: validar id en BD
              Navigator.of(context).pop();
            }
          },
          icon: const Icon(
            Icons.search_rounded,
            color: Color(0xffBA5C0B),
            size: 50.0,
          ),
        ),
      ),
    );
  }

  Widget idMotorField() {
    return Container(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextFormField(
        //se pone azul al selecionarlo
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Ingrese número de motor";
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          // prefixIcon: const Icon(
          //   Icons.eng,
          //   color: Color(0xffBA5C0B),
          // ),
          label: const Text(
            'Número de motor',
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
        onSaved: (newValue) {
          _motorcycle.idMotor = newValue!;
        },
      ),
    );
  }

  Widget idChasisField() {
    return Container(
      padding: const EdgeInsets.only(top: 15.0),
      child: TextFormField(
        //se pone azul al selecionarlo
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Ingrese el número de chasis";
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          // prefixIcon: const Icon(
          //   Icons.person,
          //   color: Color(0xffBA5C0B),
          // ),
          label: const Text(
            'Número de chasis',
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
        onSaved: (newValue) {
          _motorcycle.idchassis = newValue!;
        },
      ),
    );
  }

  Widget brandField() {
    return Expanded(
      child: TextFormField(
        //se pone azul al selecionarlo
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Ingrese la marca del vehículo";
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          // prefixIcon: const Icon(
          //   Icons.person,
          //   color: Color(0xffBA5C0B),
          // ),
          label: const Text(
            'Marca',
          ),
          hintText: "Por ejemplo: Zusuki",
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
          _motorcycle.brand = newValue!;
        },
      ),
    );
  }

  Widget modelField() {
    return Expanded(
      child: TextFormField(
        //se pone azul al selecionarlo
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Ingrese modelo";
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          // prefixIcon: const Icon(
          //   Icons.person,
          //   color: Color(0xffBA5C0B),
          // ),
          label: const Text(
            'Modelo',
          ),
          hintText: "Ejemplo: AX 100",
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
          _motorcycle.model = newValue!;
        },
      ),
    );
  }

  Widget yearRecordField() {
    return TextFormField(
      //se pone azul al selecionarlo
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Indique el año de registro";
        }
        if (value.contains(".") || value.contains(" ")) {
          return "Ingrese el número sin puntos o espacios";
        }
        if (value.length != 4) {
          return "La placa es incorrecta";
        }
        //no recuerdo pa que es el null, jaja.
        return null;
      },
      maxLength: 4,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        // prefixIcon: const Icon(
        //   Icons.year,
        //   color: Color(0xffBA5C0B),
        // ),
        label: const Text(
          'Año de registro',
        ),
        hintText: "2020",
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffBA5C0B),
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Color(0xffBA5C0B))),
      ),
      onSaved: (newValue) {
        _motorcycle.registerYear = int.tryParse(newValue!);
      },
    );
  }

  Widget botonMoto() {
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
        if (formKeyMotocycle.currentState!.validate()) {
          formKeyMotocycle.currentState!.save();
          try {
            await _controller.saveMotorcycle(_motorcycle);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("El registro de la moto fue exitoso"),
              ),
            );
            //TODO: pasarla a la siguiente pestaña, tal vez setstate de la pestaña.
            // Navigator.of(context).pop();
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const ViewMoto(),
            //   ),
            // );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.toString()),
              ),
            );
          }
          print(_motorcycle);
        }
      },
      child: const Text("Regisrar"),
    );
  }
}
