import 'package:flutter/material.dart';

class ViewDx extends StatefulWidget {
  const ViewDx({super.key});

  @override
  State<ViewDx> createState() => _ViewDxState();
}

class _ViewDxState extends State<ViewDx> {
  //Variables
  // final stateIndicadores = <String>["Apto", "No Apto"];
  // final stateEstadoAceite = <String>["Apto", "Regular", "No Apto"];
  var _indicadoresSelected = "Apto";
  var _estadoAceiteSelected = "Apto";
  var _nivelAceiteSelected = "Lleno";
  var _liqFrenosSelected = "Apto";
  var _liqEmbragueSelected = "No Tiene";
  var _liqRefrigeranteSelected = "No Tiene";
  var _espejosSelected = "Apto";
  var _claxonSelected = "Apto";
  var _tanqueSelected = "Apto";
  var _frenoDelanteroSelected = "Apto";
  var _frenoTraseroSelected = "Apto";
  var _embragueSelected = "Apto";
  var _cadenaSelected = "Apto";
  var _bujiaSelected = "Apto";
  var _bateriaSelected = "Apto";
  var _motorSelected = "Apto";
  var _tapasSelected = "Apto";
  var _kitArrastreSelected = "Apto";

  //Checbox
  bool _checkedFarola = false;
  bool _checkedTrasera = false;
  bool _checkedDirec = false;
  bool _checkedAuxiliares = false;
  bool _checkedLlantaDelantera = false;
  bool _checkedLlantaTrasera = false;
  bool _checkedRinDelantero = false;
  bool _checkedRinTrasero = false;

  //Formulario
  final formKeyDx = GlobalKey<FormState>();
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
          formDx(),
        ],
      ),
    );
  }

  Widget formDx() {
    return Form(
      key: formKeyDx,
      // autovalidateMode: AutovalidateMode.disabled,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: <Widget>[
            markPhoto(),
            //TODO: se puede hacer un slider mostrando las photos.
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 15.0),
              padding: const EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffBA5C0B),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  idicadoresRadioButton(),
                  estadoAceiteRadioButton(),
                  oilLevelRadioButton(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 15.0),
              padding: const EdgeInsets.only(top: 10.0, left: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffBA5C0B),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Expanded(child: breakFluidRadioButton()),
                  Expanded(child: clutchFluidRadioButton()),
                  Expanded(child: coolFluidRadioButton()),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 15.0),
              padding: const EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffBA5C0B),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  mirrowsRadioButton(),
                  hornRadioButton(),
                  tankRadioButton(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  Expanded(
                    child: ligthsCheckButton(),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: tiresCheckButton(),
                  )
                ],
              ),
            ),
            //aqui
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 15.0),
              padding: const EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffBA5C0B),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  frontBreakRadioButton(),
                  backBreakRadioButton(),
                  clutchRadioButton(),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 15.0),
              padding: const EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffBA5C0B),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  chainRadioButton(),
                  sparkPlugRadioButton(),
                  bateryRadioButton(),
                ],
              ),
            ),
            // Container(
            //   margin: const EdgeInsetsDirectional.only(bottom: 15.0),
            //   padding: const EdgeInsets.only(top: 10.0),
            //   decoration: BoxDecoration(
            //     border: Border.all(
            //       color: const Color(0xffBA5C0B),
            //     ),
            //     borderRadius: BorderRadius.circular(10.0),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     mainAxisSize: MainAxisSize.max,
            //     crossAxisAlignment: CrossAxisAlignment.baseline,
            //     textBaseline: TextBaseline.ideographic,
            //     children: [
            //       mirrowsRadioButton(),
            //       hornRadioButton(),
            //       tankRadioButton(),
            //     ],
            //   ),
            // ),
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 15.0),
              padding: const EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffBA5C0B),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  motorRadioButton(),
                  tapesRadioButton(),
                  dragKitRadioButton(),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: detailDxField()),

            botonDx(),
            //TODO: Text de id usuario y moto
          ],
        ),
      ),
    );
  }

  Widget markPhoto() {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 40.0,
        right: 60.0,
      ),
      margin: const EdgeInsets.only(bottom: 20.0),
      child: IconButton(
        onPressed: () {
          //TODO: Para tomar la foto
          if (formKeyDx.currentState!.validate()) {
            //TODO: validar id en BD
            Navigator.of(context).pop();
          }
        },
        icon: const Icon(
          Icons.camera_alt,
          color: Color(0xffBA5C0B),
          size: 100.0,
        ),
      ),
    );
  }

  Widget idicadoresRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Indicadores",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Apto",
                  groupValue: _indicadoresSelected,
                  onChanged: (value) {
                    setState(() {
                      _indicadoresSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Apto",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Apto",
                  groupValue: _indicadoresSelected,
                  onChanged: (value) {
                    setState(() {
                      _indicadoresSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Apto",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget estadoAceiteRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Estado de Aceite",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Apto",
                  groupValue: _estadoAceiteSelected,
                  onChanged: (value) {
                    setState(() {
                      _estadoAceiteSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Apto",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Regular",
                  groupValue: _estadoAceiteSelected,
                  onChanged: (value) {
                    setState(() {
                      _estadoAceiteSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Regular",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Apto",
                  groupValue: _estadoAceiteSelected,
                  onChanged: (value) {
                    setState(() {
                      _estadoAceiteSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Apto",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget oilLevelRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Nivel de Aceite",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Lleno",
                  groupValue: _nivelAceiteSelected,
                  onChanged: (value) {
                    setState(() {
                      _nivelAceiteSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Lleno",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Medio",
                  groupValue: _nivelAceiteSelected,
                  onChanged: (value) {
                    setState(() {
                      _nivelAceiteSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Medio",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Bajo",
                  groupValue: _nivelAceiteSelected,
                  onChanged: (value) {
                    setState(() {
                      _nivelAceiteSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Bajo",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget breakFluidRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Liquido de frenos",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Apto",
                  groupValue: _liqFrenosSelected,
                  onChanged: (value) {
                    setState(() {
                      _liqFrenosSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Apto",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Apto",
                  groupValue: _liqFrenosSelected,
                  onChanged: (value) {
                    setState(() {
                      _liqFrenosSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Apto",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget clutchFluidRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Liquido de embrague",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Tiene",
                  groupValue: _liqEmbragueSelected,
                  onChanged: (value) {
                    setState(() {
                      _liqEmbragueSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Tiene",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Tiene",
                  groupValue: _liqEmbragueSelected,
                  onChanged: (value) {
                    setState(() {
                      _liqEmbragueSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Tiene",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget coolFluidRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Liquido refrigerante",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Tiene",
                  groupValue: _liqRefrigeranteSelected,
                  onChanged: (value) {
                    setState(() {
                      _liqRefrigeranteSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Tiene",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Tiene",
                  groupValue: _liqRefrigeranteSelected,
                  onChanged: (value) {
                    setState(() {
                      _liqRefrigeranteSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Tiene",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget mirrowsRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Espejos",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Apto",
                  groupValue: _espejosSelected,
                  onChanged: (value) {
                    setState(() {
                      _espejosSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Apto",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Apto",
                  groupValue: _espejosSelected,
                  onChanged: (value) {
                    setState(() {
                      _espejosSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Apto",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget hornRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Claxón",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Apto",
                  groupValue: _claxonSelected,
                  onChanged: (value) {
                    setState(() {
                      _claxonSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Apto",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Apto",
                  groupValue: _claxonSelected,
                  onChanged: (value) {
                    setState(() {
                      _claxonSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Apto",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget tankRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Tanque",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Apto",
                  groupValue: _tanqueSelected,
                  onChanged: (value) {
                    setState(() {
                      _tanqueSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Apto",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Apto",
                  groupValue: _tanqueSelected,
                  onChanged: (value) {
                    setState(() {
                      _tanqueSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Apto",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget ligthsCheckButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffBA5C0B),
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          const Text(
            "Luces aptas",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          CheckboxListTile(
            title: const Text("Farola"),
            value: _checkedFarola,
            onChanged: (bool? value) {
              setState(() {
                _checkedFarola = value!;
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
          CheckboxListTile(
            title: const Text("Trasera"),
            value: _checkedTrasera,
            onChanged: (bool? value) {
              setState(() {
                _checkedTrasera = value!;
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
          CheckboxListTile(
            title: const Text("Direcionales"),
            value: _checkedDirec,
            onChanged: (bool? value) {
              setState(() {
                _checkedDirec = value!;
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
          CheckboxListTile(
            title: const Text("Auxiliares"),
            value: _checkedAuxiliares,
            onChanged: (bool? value) {
              setState(() {
                _checkedAuxiliares = value!;
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
        ],
      ),
    );
  }

  Widget tiresCheckButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffBA5C0B),
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          const Text(
            "Estado de llantas",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          CheckboxListTile(
            title: const Text("Llanta delantera"),
            value: _checkedLlantaDelantera,
            onChanged: (bool? value) {
              setState(() {
                _checkedLlantaDelantera = value!;
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
          CheckboxListTile(
            title: const Text("Llanta trasera"),
            value: _checkedLlantaTrasera,
            onChanged: (bool? value) {
              setState(() {
                _checkedLlantaTrasera = value!;
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
          CheckboxListTile(
            title: const Text("Rin delantero"),
            value: _checkedRinDelantero,
            onChanged: (bool? value) {
              setState(() {
                _checkedRinDelantero = value!;
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
          CheckboxListTile(
            title: const Text("Rin trasero"),
            value: _checkedRinTrasero,
            onChanged: (bool? value) {
              setState(() {
                _checkedRinTrasero = value!;
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
        ],
      ),
    );
  }

  Widget frontBreakRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Freno delantero",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Apto",
                  groupValue: _frenoDelanteroSelected,
                  onChanged: (value) {
                    setState(() {
                      _frenoDelanteroSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Apto",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Apto",
                  groupValue: _frenoDelanteroSelected,
                  onChanged: (value) {
                    setState(() {
                      _frenoDelanteroSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Apto",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget backBreakRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Freno trasero",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Apto",
                  groupValue: _frenoTraseroSelected,
                  onChanged: (value) {
                    setState(() {
                      _frenoTraseroSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Apto",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Apto",
                  groupValue: _frenoTraseroSelected,
                  onChanged: (value) {
                    setState(() {
                      _frenoTraseroSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Apto",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget clutchRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Embrague",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Apto",
                  groupValue: _embragueSelected,
                  onChanged: (value) {
                    setState(() {
                      _embragueSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Apto",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Apto",
                  groupValue: _embragueSelected,
                  onChanged: (value) {
                    setState(() {
                      _embragueSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Apto",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget chainRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Cadena",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Apto",
                  groupValue: _cadenaSelected,
                  onChanged: (value) {
                    setState(() {
                      _cadenaSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Apto",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Apto",
                  groupValue: _cadenaSelected,
                  onChanged: (value) {
                    setState(() {
                      _cadenaSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Apto",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget sparkPlugRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Bujía",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Apto",
                  groupValue: _bujiaSelected,
                  onChanged: (value) {
                    setState(() {
                      _bujiaSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Apto",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Apto",
                  groupValue: _bujiaSelected,
                  onChanged: (value) {
                    setState(() {
                      _bujiaSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Apto",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget bateryRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Batería",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Apto",
                  groupValue: _bateriaSelected,
                  onChanged: (value) {
                    setState(() {
                      _bateriaSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Apto",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Apto",
                  groupValue: _bateriaSelected,
                  onChanged: (value) {
                    setState(() {
                      _bateriaSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Apto",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Sin Carga",
                  groupValue: _bateriaSelected,
                  onChanged: (value) {
                    setState(() {
                      _bateriaSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Sin Carga",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget motorRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Motor",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Apto",
                  groupValue: _motorSelected,
                  onChanged: (value) {
                    setState(() {
                      _motorSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Apto",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Apto",
                  groupValue: _motorSelected,
                  onChanged: (value) {
                    setState(() {
                      _motorSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Apto",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget tapesRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Tapas",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Apto",
                  groupValue: _tapasSelected,
                  onChanged: (value) {
                    setState(() {
                      _tapasSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Apto",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Apto",
                  groupValue: _tapasSelected,
                  onChanged: (value) {
                    setState(() {
                      _tapasSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Apto",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget dragKitRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Kit de arrastre",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "Apto",
                  groupValue: _kitArrastreSelected,
                  onChanged: (value) {
                    setState(() {
                      _kitArrastreSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "Apto",
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Radio(
                  value: "No Apto",
                  groupValue: _kitArrastreSelected,
                  onChanged: (value) {
                    setState(() {
                      _kitArrastreSelected = value as String;
                    });
                  },
                ),
              ),
              const Text(
                "No Apto",
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget detailDxField() {
    return TextFormField(
      //se pone azul al selecionarlo
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Realice la descripción";
        }
        return null;
      },
      maxLines: 4,
      maxLength: 200,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        // prefixIcon: const Icon(
        //   Icons.person,
        //   color: Color(0xffBA5C0B),
        // ),
        label: const Text(
          'Detalle de diagnóstico',
        ),
        hintText: 'Resumen del estado general y los principales fallos',

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffBA5C0B),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }

  Widget botonDx() {
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
        if (formKeyDx.currentState!.validate()) {
          //TODO: validar en BD
          Navigator.of(context).pop();
        }
      },
      child: const Text("Regisrar"),
    );
  }
}
