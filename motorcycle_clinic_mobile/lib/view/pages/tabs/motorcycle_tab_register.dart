import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/controller/request/service_order_request.dart';
import '/controller/request/motorcycle_request.dart';
import '/controller/request/plate_request.dart';
import '/controller/motorcycle_controller.dart';
import '/controller/request/id_request.dart';

class ViewMoto extends StatefulWidget {
  final TabController? tabController;
  final IdRequest? idCustomerM;
  final PlateRequest? plate;
  final MotorcycleRequest? motorcycle;
  final ServiceOrderRequest? serviceOrder;

  const ViewMoto({
    Key? key,
    this.tabController,
    this.idCustomerM,
    this.plate,
    this.motorcycle,
    this.serviceOrder,
  }) : super(key: key);
  @override
  State<ViewMoto> createState() => _ViewMotoState();
}

class _ViewMotoState extends State<ViewMoto> {
  final _prefs = SharedPreferences.getInstance();
  final formKeyMotocycle = GlobalKey<FormState>();

  late final MotorcycleController _controller = MotorcycleController();
  TextEditingController plateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _prefs.then((pref) {
      setState(() {
        widget.motorcycle!.idUser = pref.getString("uid");
      });
    });
  }

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
              "Por favor ingrese los datos de la moto. Si ya está registrada, valide.",
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
                plateMotoField(),
                const SizedBox(
                  width: 5.0,
                ),
                iconButtonPlate(),
              ],
            ),
            idMotorField(),
            idChassisField(),
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

  Widget plateMotoField() {
    return Expanded(
      flex: 2,
      child: TextFormField(
        controller: plateController,
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
          widget.motorcycle!.plate = newValue!;
        },
      ),
    );
  }

  Widget iconButtonPlate() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(bottom: 35.0),
        child: IconButton(
          onPressed: () async {
            //Alista la variable pa la moto.a
            try {
              widget.motorcycle!.plate = plateController.text;
              var msj = ScaffoldMessenger.of(context);
              var motoInBD =
                  await _controller.getMotorcycle(widget.motorcycle!);

              msj.showSnackBar(
                const SnackBar(
                  content: Text("La moto ya se encuentra registrada"),
                ),
              );
              //TODO: hacer alert que pregunte si quiere hacer una nueva OS. O informar
              //Crea nueva OS

              DateTime now = DateTime.now();
              DateFormat formatter = DateFormat.yMd().add_Hm();
              String formated = formatter.format(now);

              // widget.serviceOrder!.date = formated;
              widget.motorcycle!.serviceOrder!.date = formated;
              widget.motorcycle!.plate = motoInBD.plate;
              widget.motorcycle!.idMotor = motoInBD.idMotor;
              widget.motorcycle!.idchassis = motoInBD.idchassis;
              widget.motorcycle!.brand = motoInBD.brand;
              widget.motorcycle!.model = motoInBD.model;
              widget.motorcycle!.registerYear = motoInBD.registerYear;
              widget.motorcycle!.idOwner = motoInBD.idOwner;

              // pasarla a la siguiente pestaña.
              widget.tabController!.animateTo(2);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.toString()),
                ),
              );
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
          widget.motorcycle!.idMotor = newValue!;
        },
      ),
    );
  }

  Widget idChassisField() {
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
          widget.motorcycle!.idchassis = newValue!;
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
          widget.motorcycle!.brand = newValue!;
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
          widget.motorcycle!.model = newValue!;
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
        widget.motorcycle!.registerYear = int.parse(newValue!);
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
        widget.motorcycle!.idOwner = widget.idCustomerM!.id.toString();
        if (formKeyMotocycle.currentState!.validate()) {
          formKeyMotocycle.currentState!.save();
          try {
            widget.plate!.plate = widget.motorcycle!.plate.toString();
            var msj = ScaffoldMessenger.of(context);
            //Iniciar orden de servicio.
            DateTime now = DateTime.now();
            DateFormat formatter = DateFormat.yMd().add_Hm();
            String formated = formatter.format(now);
            widget.serviceOrder!.date = formated;
            widget.motorcycle!.serviceOrder = widget.serviceOrder!;
            widget.motorcycle!.serviceOrder!.date = formated;

            //registra moto.
            await _controller.registerNewMotorcycle(widget.motorcycle!);

            msj.showSnackBar(
              const SnackBar(
                content: Text("El registro de la moto fue exitoso"),
              ),
            );
            //Pasarla a la siguiente pestaña, tal vez setstate de la pestaña.
            widget.tabController!.animateTo(2);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.toString()),
              ),
            );
          }
        }
      },
      child: const Text("Regisrar"),
    );
  }
}
