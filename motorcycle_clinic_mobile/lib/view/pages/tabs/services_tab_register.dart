import 'package:flutter/material.dart';

import '/controller/request/services_request.dart';

class ViewServicios extends StatefulWidget {
  const ViewServicios({super.key});

  @override
  State<ViewServicios> createState() => _ViewServiciosState();
}

class _ViewServiciosState extends State<ViewServicios> {
  //TODO: pasarlo con entidad
  List<Map<String, dynamic>>? _listServices = [];

  final formKeyServices = GlobalKey<FormState>();
  // final ServicesRequest _services = ServicesRequest();
  Map<String, dynamic>? _services = {};
  List<bool> _isChecked = [];
  //pruebita
  // final ServicesRequest _servicesTest = ServicesRequest();

  @override
  Widget build(BuildContext context) {
    // _servicesTest.nameService = "Cambio de Aceite";
    // _servicesTest.nameProduct = "Aceite tal y eso";
    // _servicesTest.priceService = 10000;
    // _servicesTest.priceProduct = 18000;

    // _listServices!.add(_servicesTest);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 20.0,
      ),
      child: Column(
        children: <Widget>[
          const Center(
            child: Text(
              "Indique el estado general del vehículo.",
              style: TextStyle(
                fontSize: 22.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffBA5C0B),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                //TODO: deben traer
                Text("Motivo"),
                Text("Diagnóstico"),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffBA5C0B),
                ),
                borderRadius: BorderRadius.circular(15.0)),
            height: 450.0,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _listServices!.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.black,
                    child: tileServicios(index),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                botonAddService(),
                botonRegisterServices(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget botonAddService() {
    return IconButton(
      onPressed: () {
        dialogService();
      },
      icon: const Icon(
        Icons.add_task,
        color: Color(0xffBA5C0B),
        size: 40.0,
      ),
    );
  }

  Widget botonRegisterServices() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff5DA767),
        textStyle: const TextStyle(fontSize: 25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 12.0),
      ),
      onPressed: () {
        //TODO: Recoger todos los servicios registrados la lista
      },
      child: const Text("Registrar Servicios"),
    );
  }

//Elementos del dialogo emergente.
  Widget service() {
    return Expanded(
      flex: 1,
      child: TextFormField(
        //se pone azul al selecionarlo
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Indique el servicio";
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          label: const Text(
            'Servicio',
          ),
          hintText: "Cambio de aceite",
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
          _services!["Nombre servicio"] = newValue!;
        },
      ),
    );
  }

  Widget valueService() {
    return Expanded(
      flex: 1,
      child: TextFormField(
        //se pone azul al selecionarlo
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Indique el valor";
          }
          if (value.contains(".") && value.contains(" ")) {
            return "Ingrese el valor sin puntos o espacios";
          }
          return null;
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          label: const Text(
            'Valor del servicio',
          ),
          hintText: "0",
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
          _services!["Precio servicio"] = int.parse(newValue!);
        },
      ),
    );
  }

  Widget product() {
    return Expanded(
      flex: 1,
      child: TextFormField(
        //se pone azul al selecionarlo
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Indique el producto";
          }
          return null;
        },
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          label: const Text(
            'Producto',
          ),
          hintText: "Aceite ",
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
          _services!["Nombre producto"] = newValue!;
        },
      ),
    );
  }

  Widget valueProduct() {
    return Expanded(
      flex: 1,
      child: TextFormField(
        //se pone azul al selecionarlo
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Indique el valor";
          }
          if (value.contains(".") && value.contains(" ")) {
            return "Ingrese el valor sin puntos o espacios";
          }
          return null;
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          label: const Text(
            'Valor del producto',
          ),
          hintText: "0",
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
          _services!["Precio producto"] = int.parse(newValue!);
        },
      ),
    );
  }

  // Widget approvedCheckbox(int index) {
  //   return;
  // }

  Widget cancelDialogButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        textStyle: const TextStyle(fontSize: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text(
        "Cancel",
        style: TextStyle(color: Colors.white),
      ),
      // color: const Color(0xFF1BC0C5),
    );
  }

  Widget acceptDialogButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff5DA767),
        textStyle: const TextStyle(fontSize: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      ),
      onPressed: () {
        if (formKeyServices.currentState!.validate()) {
          //Para poder guardar datos nuevos, el otro guaradaba los mismos datos
          Map<String, dynamic> servicesElement = {};
          formKeyServices.currentState!.save();

          servicesElement["Nombre servicio"] = _services!["Nombre servicio"];
          servicesElement["Nombre producto"] = _services!["Nombre producto"];
          servicesElement["Precio servicio"] = _services!["Precio servicio"];
          servicesElement["Precio producto"] = _services!["Precio producto"];
          servicesElement["Aprobacion"] = false;
          _listServices!.add(servicesElement);
          _isChecked.add(false);
          setState(() {});
          Navigator.of(context).pop();
        }
        // _services!.clear();
      },
      child: const Text(
        "Agregar",
        style: TextStyle(color: Colors.white),
      ),
      // color: const Color(0xFF1BC0C5),
    );
  }

  Future<Object?> dialogService() {
    return showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height - 200,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: const Color(0xffFEFAE0),
              ),
              child: Material(
                color: const Color(0xffFEFAE0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //TODO: agrupador de servicios
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 25.0),
                      child: const Center(
                        child: Text(
                          "Ingrese el servicio necesario.",
                          style: TextStyle(fontSize: 22.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    formDiaglog(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget formDiaglog() {
    return Form(
      //TODO: entity para recoger los servicios y guardarlos en la orden
      key: formKeyServices,
      child: Column(
        children: [
          Row(children: [
            service(),
            const SizedBox(width: 10.0),
            valueService(),
          ]),
          const SizedBox(height: 20.0),
          Row(children: [
            product(),
            const SizedBox(width: 10.0),
            valueProduct(),
          ]),
          const SizedBox(
            height: 15.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            acceptDialogButton(),
            cancelDialogButton(),
          ]),
        ],
      ),
    );
  }

//TODO al builder.
  Widget tileServicios(int index) {
    int indexTile = index;
    return ListTile(
      tileColor: const Color(0xffFEFAE0),
      title: Text(_listServices![indexTile]["Nombre servicio"]),
      subtitle: Text(_listServices![indexTile]["Nombre producto"]),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      leading: (true
          ? const Icon(
              Icons.check,
              color: Color(0xff4D581C),
              size: 40.0,
            )
          : const Icon(
              Icons.warning,
              color: Color(0xffEEA153),
              size: 40.0,
            )),
      trailing: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(_listServices![indexTile]["Precio servicio"].toString()),
                Text(_listServices![indexTile]["Precio producto"].toString()),
              ],
            ),
            Switch(
              // This bool value toggles the switch.
              value: _isChecked[indexTile],
              activeColor: const Color(0xffBA5C0B),
              onChanged: (bool value) {
                // This is called when the user toggles the switch.
                _listServices![indexTile]["Aprobacion"] = value;
                _isChecked[indexTile] = _listServices![indexTile]["Aprobacion"];
                setState(() {
                  _isChecked[indexTile];
                });

                print(_listServices);
              },
            )
          ],
        ),
      ),
      onLongPress: () {
        // index
        //TODO: para eliminar el servicio o editarlo
      },
    );
  }
}
