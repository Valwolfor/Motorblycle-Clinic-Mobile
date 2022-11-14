import 'package:flutter/material.dart';

class ViewServicios extends StatefulWidget {
  const ViewServicios({super.key});

  @override
  State<ViewServicios> createState() => _ViewServiciosState();
}

class _ViewServiciosState extends State<ViewServicios> {
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
              "Indique el estado general del vehículo.",
              style: TextStyle(
                fontSize: 22.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15.0),
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
          tileServicios(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                botonAgregarServicio(),
                botonRegistarServicios(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget tileServicios() {
    var _nameService = "Cambio aceite";
    var _nameProduct = "Aceite GW / 200";
    var _priceService = 10000;
    var _priceProduct = 15000;
    bool _authorization = false;
    return Material(
      elevation: 20,
      shadowColor: Colors.black.withAlpha(90),
      child: ListTile(
        tileColor: const Color(0xffFEFAE0),
        title: Text(_nameService),
        subtitle: Text(_nameProduct),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        leading: (_authorization
            ? const Icon(
                Icons.check,
                color: const Color(0xff4D581C),
                size: 40.0,
              )
            : const Icon(
                Icons.warning,
                color: Color(0xffEEA153),
                size: 40.0,
              )),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(_priceService.toString()),
            Text(_priceProduct.toString()),
          ],
        ),
        onLongPress: () {
          //TODO: para eliminar el servicio o editarlo
        },
      ),
    );
  }

  Widget botonAgregarServicio() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.add_task,
        color: Color(0xffBA5C0B),
        size: 40.0,
      ),
    );
  }

  Widget botonRegistarServicios() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff5DA767),
        textStyle: const TextStyle(fontSize: 25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
      ),
      onPressed: () {
        //TODO: Recoger todos los servicios registrados
      },
      child: const Text("Agregar Servicio"),
    );
  }
}
