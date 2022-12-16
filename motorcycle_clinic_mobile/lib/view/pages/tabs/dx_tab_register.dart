import 'package:flutter/material.dart';

import '/controller/motorcycle_controller.dart';
import '/controller/request/dx_request.dart';
import '/controller/request/motorcycle_request.dart';

class ViewDx extends StatefulWidget {
  final TabController? tabController;
  final MotorcycleRequest? motorcycle;

  const ViewDx({
    Key? key,
    this.tabController,
    this.motorcycle,
  }) : super(key: key);

  @override
  State<ViewDx> createState() => _ViewDxState();
}

class _ViewDxState extends State<ViewDx> {
  //Request
  late final DxRequest _dx = DxRequest();
  late final MotorcycleController _controller = MotorcycleController();

  //Variables
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

  final List<String> _listLigths = [];
  final List<String> _listTiresState = [];

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
                fontSize: 18.0,
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
                  oilStateRadioButton(),
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
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
            "Muy pronto podrás realizar fotografías en tus diagnóstico.",
          )));
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Indicadores",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Apto",
                  groupValue: _indicadoresSelected,
                  onChanged: (value) {
                    setState(() {
                      _indicadoresSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Apto",
                  groupValue: _indicadoresSelected,
                  onChanged: (value) {
                    setState(() {
                      _indicadoresSelected = value!;
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

  Widget oilStateRadioButton() {
    return Container(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Estado de Aceite",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Apto",
                  groupValue: _estadoAceiteSelected,
                  onChanged: (value) {
                    setState(() {
                      _estadoAceiteSelected = value!;
                    });
                  },
                ),
              ),
              const Text(
                "Apto",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Regular",
                  groupValue: _estadoAceiteSelected,
                  onChanged: (value) {
                    setState(() {
                      _estadoAceiteSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Apto",
                  groupValue: _estadoAceiteSelected,
                  onChanged: (value) {
                    setState(() {
                      _estadoAceiteSelected = value!;
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Nivel de Aceite",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Lleno",
                  groupValue: _nivelAceiteSelected,
                  onChanged: (value) {
                    setState(() {
                      _nivelAceiteSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "Medio",
                  groupValue: _nivelAceiteSelected,
                  onChanged: (value) {
                    setState(() {
                      _nivelAceiteSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "Bajo",
                  groupValue: _nivelAceiteSelected,
                  onChanged: (value) {
                    setState(() {
                      _nivelAceiteSelected = value!;
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Liquido de frenos",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Apto",
                  groupValue: _liqFrenosSelected,
                  onChanged: (value) {
                    setState(() {
                      _liqFrenosSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Apto",
                  groupValue: _liqFrenosSelected,
                  onChanged: (value) {
                    setState(() {
                      _liqFrenosSelected = value!;
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Liquido de embrague",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Tiene",
                  groupValue: _liqEmbragueSelected,
                  onChanged: (value) {
                    setState(() {
                      _liqEmbragueSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Tiene",
                  groupValue: _liqEmbragueSelected,
                  onChanged: (value) {
                    setState(() {
                      _liqEmbragueSelected = value!;
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
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Tiene",
                  groupValue: _liqRefrigeranteSelected,
                  onChanged: (value) {
                    setState(() {
                      _liqRefrigeranteSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Tiene",
                  groupValue: _liqRefrigeranteSelected,
                  onChanged: (value) {
                    setState(() {
                      _liqRefrigeranteSelected = value!;
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
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Apto",
                  groupValue: _espejosSelected,
                  onChanged: (value) {
                    setState(() {
                      _espejosSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Apto",
                  groupValue: _espejosSelected,
                  onChanged: (value) {
                    setState(() {
                      _espejosSelected = value!;
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
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Apto",
                  groupValue: _claxonSelected,
                  onChanged: (value) {
                    setState(() {
                      _claxonSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Apto",
                  groupValue: _claxonSelected,
                  onChanged: (value) {
                    setState(() {
                      _claxonSelected = value!;
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
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Apto",
                  groupValue: _tanqueSelected,
                  onChanged: (value) {
                    setState(() {
                      _tanqueSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Apto",
                  groupValue: _tanqueSelected,
                  onChanged: (value) {
                    setState(() {
                      _tanqueSelected = value!;
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
            style: TextStyle(fontSize: 16.0),
          ),
          CheckboxListTile(
            title: const Text(
              "Farola",
              style: TextStyle(fontSize: 15.0),
            ),
            value: _checkedFarola,
            onChanged: (bool? value) {
              setState(() {
                _checkedFarola = value!;
                if (_checkedFarola == true) {
                  _listLigths.add("Farola");
                } else {
                  var checkeo = _listLigths.contains("Farola");
                  checkeo ? _listLigths.remove("Farola") : null;
                }
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
          CheckboxListTile(
            title: const Text(
              "Trasera",
              style: TextStyle(fontSize: 15.0),
            ),
            value: _checkedTrasera,
            onChanged: (bool? value) {
              setState(() {
                _checkedTrasera = value!;
                if (_checkedTrasera == true) {
                  _listLigths.add("Trasera");
                } else {
                  var checkeo = _listLigths.contains("Trasera");
                  checkeo ? _listLigths.remove("Trasera") : null;
                }
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
          CheckboxListTile(
            title: const Text(
              "Direcional",
              style: TextStyle(fontSize: 15.0),
            ),
            value: _checkedDirec,
            onChanged: (bool? value) {
              setState(() {
                _checkedDirec = value!;
                if (_checkedDirec == true) {
                  _listLigths.add("Direcionales");
                } else {
                  var checkeo = _listLigths.contains("Direcionales");
                  checkeo ? _listLigths.remove("Direcionales") : null;
                }
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
          CheckboxListTile(
            title: const Text(
              "Auxiliares",
              style: TextStyle(fontSize: 15.0),
            ),
            value: _checkedAuxiliares,
            onChanged: (bool? value) {
              setState(() {
                _checkedAuxiliares = value!;
                if (_checkedAuxiliares == true) {
                  _listLigths.add("Auxiliares");
                } else {
                  var checkeo = _listLigths.contains("Auxiliares");
                  checkeo ? _listLigths.remove("Auxiliares") : null;
                }
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
            style: TextStyle(fontSize: 16.0),
          ),
          CheckboxListTile(
            title: const Text(
              "Llanta delantera",
              style: TextStyle(fontSize: 15.0),
            ),
            value: _checkedLlantaDelantera,
            onChanged: (bool? value) {
              setState(() {
                _checkedLlantaDelantera = value!;
                if (_checkedLlantaDelantera == true) {
                  _listTiresState.add("Llanta delantera");
                } else {
                  var checkeo = _listTiresState.contains("Llanta delantera");
                  checkeo ? _listTiresState.remove("Llanta delantera") : null;
                }
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
          CheckboxListTile(
            title: const Text(
              "Llanta trasera",
              style: TextStyle(fontSize: 15.0),
            ),
            value: _checkedLlantaTrasera,
            onChanged: (bool? value) {
              setState(() {
                _checkedLlantaTrasera = value!;
                if (_checkedLlantaTrasera == true) {
                  _listTiresState.add("Llanta trasera");
                } else {
                  var checkeo = _listTiresState.contains("Llanta trasera");
                  checkeo ? _listTiresState.remove("Llanta trasera") : null;
                }
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
          CheckboxListTile(
            title: const Text(
              "Rin delantero",
              style: TextStyle(fontSize: 15.0),
            ),
            value: _checkedRinDelantero,
            onChanged: (bool? value) {
              setState(() {
                _checkedRinDelantero = value!;
                if (_checkedRinDelantero == true) {
                  _listTiresState.add("Rin delantero");
                } else {
                  var checkeo = _listTiresState.contains("Rin delantero");
                  checkeo ? _listTiresState.remove("Rin delantero") : null;
                }
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
          CheckboxListTile(
            title: const Text(
              "Rin trasero",
              style: TextStyle(fontSize: 15.0),
            ),
            value: _checkedRinTrasero,
            onChanged: (bool? value) {
              setState(() {
                _checkedRinTrasero = value!;
                if (_checkedRinTrasero == true) {
                  _listTiresState.add("Rin trasero");
                } else {
                  var checkeo = _listTiresState.contains("Rin trasero");
                  checkeo ? _listTiresState.remove("Rin trasero") : null;
                }
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
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Apto",
                  groupValue: _frenoDelanteroSelected,
                  onChanged: (value) {
                    setState(() {
                      _frenoDelanteroSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Apto",
                  groupValue: _frenoDelanteroSelected,
                  onChanged: (value) {
                    setState(() {
                      _frenoDelanteroSelected = value!;
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
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Apto",
                  groupValue: _frenoTraseroSelected,
                  onChanged: (value) {
                    setState(() {
                      _frenoTraseroSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Apto",
                  groupValue: _frenoTraseroSelected,
                  onChanged: (value) {
                    setState(() {
                      _frenoTraseroSelected = value!;
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
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Apto",
                  groupValue: _embragueSelected,
                  onChanged: (value) {
                    setState(() {
                      _embragueSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Apto",
                  groupValue: _embragueSelected,
                  onChanged: (value) {
                    setState(() {
                      _embragueSelected = value!;
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
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Apto",
                  groupValue: _cadenaSelected,
                  onChanged: (value) {
                    setState(() {
                      _cadenaSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Apto",
                  groupValue: _cadenaSelected,
                  onChanged: (value) {
                    setState(() {
                      _cadenaSelected = value!;
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
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Apto",
                  groupValue: _bujiaSelected,
                  onChanged: (value) {
                    setState(() {
                      _bujiaSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Apto",
                  groupValue: _bujiaSelected,
                  onChanged: (value) {
                    setState(() {
                      _bujiaSelected = value!;
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
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Apto",
                  groupValue: _bateriaSelected,
                  onChanged: (value) {
                    setState(() {
                      _bateriaSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Apto",
                  groupValue: _bateriaSelected,
                  onChanged: (value) {
                    setState(() {
                      _bateriaSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "Sin Carga",
                  groupValue: _bateriaSelected,
                  onChanged: (value) {
                    setState(() {
                      _bateriaSelected = value!;
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
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Apto",
                  groupValue: _motorSelected,
                  onChanged: (value) {
                    setState(() {
                      _motorSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Apto",
                  groupValue: _motorSelected,
                  onChanged: (value) {
                    setState(() {
                      _motorSelected = value!;
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
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Apto",
                  groupValue: _tapasSelected,
                  onChanged: (value) {
                    setState(() {
                      _tapasSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Apto",
                  groupValue: _tapasSelected,
                  onChanged: (value) {
                    setState(() {
                      _tapasSelected = value!;
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
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.2,
                child: Radio(
                  value: "Apto",
                  groupValue: _kitArrastreSelected,
                  onChanged: (value) {
                    setState(() {
                      _kitArrastreSelected = value!;
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
                scale: 1.2,
                child: Radio(
                  value: "No Apto",
                  groupValue: _kitArrastreSelected,
                  onChanged: (value) {
                    setState(() {
                      _kitArrastreSelected = value!;
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
      onSaved: (newValue) {
        _dx.detailDx = newValue;
      },
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
      onPressed: () async {
        if (formKeyDx.currentState!.validate()) {
          formKeyDx.currentState!.save();
          //Variables asginadas.
          _dx.indicators = _indicadoresSelected;
          _dx.oilState = _estadoAceiteSelected;
          _dx.oilLvl = _nivelAceiteSelected;
          _dx.brakeFluid = _liqFrenosSelected;
          _dx.cluchtFluid = _liqEmbragueSelected;
          _dx.coolantFluid = _liqRefrigeranteSelected;
          _dx.mirrows = _espejosSelected;
          _dx.horm = _claxonSelected;
          _dx.tank = _tanqueSelected;
          _dx.forwardBrake = _frenoDelanteroSelected;
          _dx.backBrake = _frenoTraseroSelected;
          _dx.clucht = _embragueSelected;
          _dx.chain = _cadenaSelected;
          _dx.sparkPlug = _bujiaSelected;
          _dx.batery = _bateriaSelected;
          _dx.motor = _motorSelected;
          _dx.tapes = _tapasSelected;
          _dx.dragKit = _kitArrastreSelected;

          //listas
          _dx.ligths = _listLigths;
          _dx.tires = _listTiresState;

          //A la BD
          try {
            var msj = ScaffoldMessenger.of(context);

            await _controller.registerDx(widget.motorcycle!, _dx);

            msj.showSnackBar(
              const SnackBar(
                content: Text("El registro del diagnóstico fue exitoso"),
              ),
            );
            widget.tabController!.animateTo(4);
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
