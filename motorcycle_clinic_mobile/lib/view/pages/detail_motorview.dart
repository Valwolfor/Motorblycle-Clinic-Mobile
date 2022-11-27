import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:motorcycle_clinic_mobile/model/entity/motorcycle.dart';

import '../widgets/app_bar_menu.dart';

class DetailMotorcycle extends StatefulWidget {
  final MotorcycleEntity? moto;

  const DetailMotorcycle({
    Key? key,
    this.moto,
  }) : super(key: key);

  @override
  State<DetailMotorcycle> createState() => _DetailMotorcycleState();
}

class _DetailMotorcycleState extends State<DetailMotorcycle> {
  Map<String, dynamic>? _servicesOrders;

  final List<Map<String, dynamic>> _servicesOrdersList = [];

  var estado;

  @override
  Widget build(BuildContext context) {
    estado = false;
    return Scaffold(
      backgroundColor: const Color(0xffFEFAE0),
      appBar: AppBar(
        title: Center(
            child: Text(
          "Historial de : ${widget.moto!.plate}",
          style: const TextStyle(fontSize: 23.0),
        )),
        backgroundColor: const Color(0xff4D581C),
        actions: const <Widget>[
          AppBMenu(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
            Container(
              margin: const EdgeInsets.only(
                left: 5.0,
                right: 5.0,
                bottom: 10.0,
              ),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffBA5C0B),
                ),
                color: const Color(0xff5DA767),
                borderRadius: BorderRadius.circular(10.0),
              ),
              // height: 570.0,
              child: listBuilderMotos(),
            ),
          ],
        ),
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      "Año de registro: ", "${widget.moto!.registerYear}"),
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
          fontSize: 18.0,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget listBuilderMotos() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _servicesOrdersList.length,
      itemBuilder: (context, index) {
        // _servicesOrders = widget.moto!.serviceOrdersMapsList!;
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          child: Material(
            borderOnForeground: true,
            color: const Color(0xffFEFAE0),
            elevation: 18,
            borderRadius: BorderRadius.circular(10.0),
            shadowColor: Colors.black,
            child: arcodeonDetail(index),
          ),
        );
      },
    );
  }

  Widget arcodeonDetail(int index) {
    return Accordion(
      maxOpenSections: 1,
      // headerBackgroundColorOpened: Colors.black54,
      scaleWhenAnimating: true,
      openAndCloseAnimation: true,
      headerPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
      sectionClosingHapticFeedback: SectionHapticFeedback.light,
      paddingBetweenClosedSections: 5.0,
      paddingListTop: 5.0,
      paddingListBottom: 5.0,
      paddingListHorizontal: 5.0,
      children: [
        AccordionSection(
          isOpen: true,
          leftIcon: const Icon(Icons.article_rounded, color: Colors.white),
          header: Text(
            'Ingreso en: ',
            style: const TextStyle(fontSize: 21.0, color: Colors.white),
          ),
          headerBackgroundColor: const Color(0xff5DA767),
          headerBackgroundColorOpened: const Color(0xffBA5C0B),
          contentBorderColor: const Color(0xff5DA767),
          contentBackgroundColor: const Color(0xffFEFAE0),
          contentHorizontalPadding: 1.0,
          content: Column(
            children: [
              reasonDetail(),
              Accordion(
                maxOpenSections: 1,
                headerBackgroundColorOpened: Colors.black54,
                children: [
                  AccordionSection(
                    isOpen: true,
                    leftIcon: const Icon(Icons.medical_information,
                        color: Colors.white),
                    headerBackgroundColor: const Color(0xffBA5C0B),
                    headerBackgroundColorOpened: const Color(0xffEEA15E),
                    headerPadding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 10.0),
                    header: const Text(
                      'Diagnóstico',
                      style: TextStyle(fontSize: 21.0, color: Colors.white),
                    ),
                    content: dxDetail(),
                    contentHorizontalPadding: 1.0,
                    contentBorderColor: Colors.black54,
                    contentBackgroundColor: const Color(0xffFEFAE0),
                  ),
                  AccordionSection(
                    isOpen: false,
                    leftIcon: const Icon(Icons.home_repair_service,
                        color: Colors.white),
                    header: Text('Servicios reagistrados',
                        style: TextStyle(
                          fontSize: 21.0,
                          color: Colors.white,
                        )),
                    headerPadding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 10.0),
                    headerBackgroundColor: const Color(0xffBA5C0B),
                    headerBackgroundColorOpened: const Color(0xffEEA15E),
                    contentBackgroundColor: const Color(0xffFEFAE0),
                    contentHorizontalPadding: 5.0,
                    content: tileServicios(index),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget reasonDetail() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Motivo:",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Text("Kilometraje:",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  Text("Gasolina:",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  Text("Ruta:",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  Text("Anticipo:",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  Text("Valor Anticipo:",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  Text("Detalle motivo:",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Motivo",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  Text("Kilometraje",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  Text("Gasolina",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  Text("Ruta",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  Text("Anticipo",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  Text("Valor Anticipo",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                  Text("Detalle motivo",
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget dxDetail() {
    return Column(
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
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
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
          children: [
            const Expanded(
              child: Text("Luces aptas",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
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
                leading: (true //valor de farola
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
                leading: (estado //valor de farola
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
                title: const Text("Direcionales",
                    style: TextStyle(
                      fontSize: 14.0,
                    )),
                leading: (estado //valor de farola
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
                leading: (estado //valor de farola
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
          children: [
            const Expanded(
              child: Text("Lllantas aptas",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
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
                leading: (true //valor de farola
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
                leading: (estado //valor de farola
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
                leading: (estado //valor de farola
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
                leading: (estado //valor de farola
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
                      )),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text("Freso trasero",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
                      )),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text("Embrague",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
                      )),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text("Bujía",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
                      )),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text("Batería",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
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
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
                      )),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text("Tapas",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
                      )),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text("Kit de arrastre",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text("value",
                      style: TextStyle(
                        fontSize: 16.0,
                      )),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text("Detalle del Diagnóstico:  ",
            // "Detalle de diagnóstico: ####################################################################################################",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            )),
        Text(
            " Detalle de diagnóstico: ####################################################################################################",
            style: TextStyle(
              fontSize: 16.0,
            )),
      ],
    );
  }

  Widget tileServicios(int index) {
    int indexTile = 0;
    return ListTile(
      tileColor: const Color(0xffFEFAE0),
      title: Text("servicesElement[]"),
      subtitle: Text("servicesElement[]"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      leading: (estado
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
              Text("servicesElement"),
              Text("servicesElement"),
            ],
          ),
        ],
      ),
    );
  }
}
