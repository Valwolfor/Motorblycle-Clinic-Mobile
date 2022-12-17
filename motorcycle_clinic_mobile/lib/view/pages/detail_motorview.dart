import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';

import '/controller/response/list_motos_response.dart';
import '../widgets/app_bar_menu.dart';

class DetailMotorcycle extends StatefulWidget {
  final MotorcycleResponse? moto;

  const DetailMotorcycle({
    Key? key,
    this.moto,
  }) : super(key: key);

  @override
  State<DetailMotorcycle> createState() => _DetailMotorcycleState();
}

class _DetailMotorcycleState extends State<DetailMotorcycle> {
  List<dynamic> _listLigths = [];
  List<dynamic> _listTires = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEFAE0),
      appBar: AppBar(
        title: Center(
            child: Text(
          "Historial de : ${widget.moto!.plate}",
          style: const TextStyle(fontSize: 20.0),
        )),
        backgroundColor: const Color(0xff4D581C),
        actions: const <Widget>[
          AppBMenu(),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0,
              ),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffBA5C0B),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 200.0,
              child: motoDetail(),
            ),
          ),
          sliverBuilderMotos(),
        ],
      ),
    );
  }

  Widget motoDetail() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  richTextMoto("ID cliente: ", "${widget.moto!.idOwner}"),
                  const SizedBox(
                    height: 5.0,
                  ),
                  richTextMoto(
                    "Año de registro: ",
                    "${widget.moto!.registerYear}",
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  richTextMoto("Marca: ", "${widget.moto!.brand}"),
                  const SizedBox(
                    height: 5.0,
                  ),
                  richTextMoto("Modelo: ", "${widget.moto!.model}"),
                ],
              ),
            ),
          ],
        ),
        richTextMoto("ID motor: ", "${widget.moto!.idMotor}"),
        richTextMoto("ID chasis: ", "${widget.moto!.idchassis}"),
        richTextMoto("Mecánico: ", "${widget.moto!.idUser}"),
      ],
    );
  }

  Widget richTextMoto(String text, String value) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 15.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget sliverBuilderMotos() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          index = index + 1;
          return expansionTileDetail(index);
        },
        childCount: widget.moto!.serviceOrdersMaps!.length,
      ),
    );
  }

  Widget expansionTileDetail(int index) {
    return Container(
      margin: const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 15.0),
      child: Material(
        elevation: 5.0,
        shadowColor: const Color(0xffBA5C0B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: ExpansionTile(
            leading: const Icon(
              Icons.article_rounded,
              color: Colors.white,
            ),
            title: Text(
              'Ingreso en: ${widget.moto!.serviceOrdersMaps!["$index"]["date"]}',
              style: const TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            subtitle: Text(
              "Mecánico: ${widget.moto!.idUser}",
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color(0xff4D581C),
            collapsedBackgroundColor: const Color(0xffBA5C0B),
            children: [
              Container(
                color: const Color(0xffFEFAE0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: Column(
                  children: [
                    reasonDetail(index),
                    const SizedBox(
                      height: 10.0,
                    ),
                    //Diagnóstico
                    Material(
                      elevation: 5.0,
                      shadowColor: const Color(0xffBA5C0B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: ExpansionTile(
                          title: const Text("Diagnóstico",
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white)),
                          backgroundColor: const Color(0xff4D581C),
                          collapsedBackgroundColor: const Color(0xffBA5C0B),
                          children: [
                            Container(
                              color: const Color(0xffFEFAE0),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: dxDetail(index),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    //Servicios registrados
                    Material(
                      elevation: 5.0,
                      shadowColor: const Color(0xffBA5C0B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: ExpansionTile(
                          title: const Text("Servicios registrados",
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.white)),
                          backgroundColor: const Color(0xff4D581C),
                          collapsedBackgroundColor: const Color(0xffBA5C0B),
                          children: [
                            Container(
                              color: const Color(0xffFEFAE0),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: builderTileServices(index),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget reasonDetail(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Text>[
                    Text(
                      "Motivo: ",
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    Text("Kilometraje: ",
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                    Text("Gasolina: ",
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                    Text("Ruta: ",
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                    Text("Anticipo:",
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                    Text("Valor Anticipo:",
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["reason"]["reason"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["reason"]["mileage"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["reason"]["lvlGas"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                    Text(
                        widget.moto!.serviceOrdersMaps!["$index"]["reason"]
                                ["authRute"]
                            ? 'Sí'
                            : 'No',
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                    Text(
                        widget.moto!.serviceOrdersMaps!["$index"]["reason"]
                                ["advancePayment"]
                            ? 'Sí'
                            : 'No',
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["reason"]["advanceValue"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Detalle motivo:",
                        style: TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${widget.moto!.serviceOrdersMaps!["$index"]["reason"]["reasonDetail"]}",
                      style: const TextStyle(
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget dxDetail(int index) {
    _listLigths = widget.moto!.serviceOrdersMaps!["$index"]["dx"]["ligths"];
    _listTires = widget.moto!.serviceOrdersMaps!["$index"]["dx"]["tires"];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          //Fila
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text("Indicadores",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["oilState"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("Estado de aceite",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["oilState"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("Nivel de aceite",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["oilLvl"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
            ],
          ),
          //Fila 2
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text("Liquido de frenos",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["brakeFluid"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("Liquido de embrague",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["clutchFluid"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("Liquido refrigerante",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["coolantFluid"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
            ],
          ),
//Fila 3
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text("Espejos",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["mirrows"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("Claxón",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["horm"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("Tanque",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["tank"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
            ],
          ),
          //fila 4
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: const [
              Expanded(
                child: Text("Luces aptas",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: ListTile(
                  title: const Text("Delantera",
                      style: TextStyle(
                        fontSize: 14.0,
                      )),
                  leading: (_listLigths.contains("Farola")
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
                ),
              ),
              Flexible(
                child: ListTile(
                  title: const Text("Trasera",
                      style: TextStyle(
                        fontSize: 14.0,
                      )),
                  leading: (_listLigths.contains("Trasera")
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
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: ListTile(
                  title: const Text("Direccionales",
                      style: TextStyle(
                        fontSize: 14.0,
                      )),
                  leading: (_listLigths.contains("Direcionales")
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
                ),
              ),
              Flexible(
                child: ListTile(
                  title: const Text("Auxiliares",
                      style: TextStyle(
                        fontSize: 14.0,
                      )),
                  leading: (_listLigths.contains("Auxiliares")
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
                ),
              ),
            ],
          ),
          //fila 5
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: const [
              Expanded(
                child: Text("Llantas aptas",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: ListTile(
                  title: const Text("Delantera",
                      style: TextStyle(
                        fontSize: 14.0,
                      )),
                  leading:
                      (_listTires.contains("Llanta delantera") //valor de farola
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
                ),
              ),
              Flexible(
                child: ListTile(
                  title: const Text("Trasera",
                      style: TextStyle(
                        fontSize: 14.0,
                      )),
                  leading:
                      (_listTires.contains("Llanta trasera") //valor de farola
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
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: ListTile(
                  title: const Text("Rin delantero",
                      style: TextStyle(
                        fontSize: 14.0,
                      )),
                  leading:
                      (_listTires.contains("Rin delantero") //valor de farola
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
                ),
              ),
              Flexible(
                child: ListTile(
                  title: const Text("Rin trasero",
                      style: TextStyle(
                        fontSize: 14.0,
                      )),
                  leading: (_listTires.contains("Rin trasero") //valor de farola
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
                ),
              ),
            ],
          ),
//Fila 6
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text("Freno delantero",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["forwardBrake"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("Freso trasero",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["backBrake"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("Embrague",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["clutch"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
            ],
          ),
//Fila 7
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text("Cadena",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["chain"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("Bujía",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["sparkPlug"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("Batería",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["batery"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
            ],
          ),
//Fila 8
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text("Motor",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["motor"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("Tapas",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["tapes"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("Kit de arrastre",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["dargKit"]}",
                        style: const TextStyle(
                          fontSize: 15.0,
                        )),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text("Detalle del Diagnóstico:  ",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(
            height: 10.0,
          ),
          Text("${widget.moto!.serviceOrdersMaps!["$index"]["dx"]["detailDx"]}",
              style: const TextStyle(
                fontSize: 15.0,
              )),
        ],
      ),
    );
  }

  Widget builderTileServices(int index) {
    List<dynamic> servicesList = [];
    servicesList =
        widget.moto!.serviceOrdersMaps!["$index"]["listServices"]["services"];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: servicesList.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.black,
            child: tileServicios(index, servicesList),
          ),
        );
      },
    );
  }

  Widget tileServicios(int index, List<dynamic> servicesList) {
    return ListTile(
      tileColor: const Color(0xffFEFAE0),
      title: Text(
        "${servicesList[index]["nameService"]}",
        style: const TextStyle(fontSize: 15.0),
      ),
      subtitle: Text(
        "${servicesList[index]["nameProduct"]}",
        style: const TextStyle(fontSize: 15.0),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      leading: (servicesList[index]["approvated"]
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
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "${servicesList[index]["priceService"]}",
                style: const TextStyle(fontSize: 15.0),
              ),
              Text(
                "${servicesList[index]["priceProduct"]}",
                style: const TextStyle(fontSize: 15.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
