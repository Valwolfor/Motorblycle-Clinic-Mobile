import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/controller/request/reason_request.dart';
import '/controller/request/motorcycle_request.dart';
import '/controller/motorcycle_controller.dart';

class ViewReason extends StatefulWidget {
  final TabController? tabController;
  final MotorcycleRequest? motorcycle;

  const ViewReason({
    Key? key,
    this.tabController,
    this.motorcycle,
  }) : super(key: key);

  @override
  State<ViewReason> createState() => _ViewReasonState();
}

class _ViewReasonState extends State<ViewReason> {
  late final ReasonRequest _reason = ReasonRequest();
  late final MotorcycleController _controller = MotorcycleController();
//Dropmenu motivo
  var _selectedValue;

  final _reasons = <String>[
    'Mantenimiento',
    'Reparación',
    'Personalización',
    'Revisión'
  ];
  //Radiobutton combustible
  final gasLevel = <String>["Empty", "1/4", "1/2", "3/4", "Full"];
  var _gasSelected = "Empty";
  //Checbox
  bool _checkedLicencia = false;
  bool _checkedSoat = false;
  bool _checkedTecno = false;
  bool _checkedAnticipo = false;
  bool _checkedAutorizacion = false;

  final formKeyReason = GlobalKey<FormState>();

  final List<String> documentslist = [];

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
              "Por favor indique el motivo de ingreso",
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          formReason(),
        ],
      ),
    );
  }

  //Formulario
  Widget formReason() {
    return Form(
      key: formKeyReason,
      // autovalidateMode: AutovalidateMode.disabled,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                dropdownReason(),
                const SizedBox(
                  width: 5.0,
                ),
                mileageField(),
              ],
            ),
            detailReasonField(),
            gasRadioButton(),
            documentsCheckButton(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                children: [
                  Expanded(child: advancePaymentCheckbox()),
                  // brandField(),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(child: authRuteCheckbox()),
                ],
              ),
            ),
            botonReason(),
            //TODO: Text de id usuario y moto
          ],
        ),
      ),
    );
  }

  //Wigets
  Widget dropdownReason() {
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
          label: const Text('Motivo de ingreso'),
        ),
        value: _selectedValue,

        items: _reasons
            .map<DropdownMenuItem>((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
            .toList(),
        onChanged: (value) {
          _reason.reason = value;
          // widget.serviceOrder!.reason!.reason = value;
          setState(
            () {
              _selectedValue = value as String;
            },
          );
        },
      ),
    );
  }

  Widget mileageField() {
    return Expanded(
      child: TextFormField(
        //se pone azul al selecionarlo
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Ingrese valor";
          }
          if (value.contains(".") || value.contains(" ")) {
            return "Ingrese valor";
          }
          return null;
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          label: const Text(
            'Kilometraje',
          ),
          hintText: "Sin puntos",
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
          _reason.mileage = int.tryParse(newValue!)!;
          _reason.advanceValue = 0;
        },
      ),
    );
  }

  Widget detailReasonField() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: TextFormField(
        //se pone azul al selecionarlo
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Realice la descripción";
          }
          return null;
        },
        maxLines: 4,
        maxLength: 150,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          // prefixIcon: const Icon(
          //   Icons.person,
          //   color: Color(0xffBA5C0B),
          // ),
          label: const Text(
            'Detalle del motivo',
          ),
          hintText: 'Realice una corta descripción del motivo de ingreso',

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
          _reason.reasonDetail = newValue!;
          // widget.serviceOrder!.reason!.reasonDetail = newValue;
        },
      ),
    );
  }

  Widget gasRadioButton() {
    return Container(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              "Nivel de combustible",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 17.0),
            ),
            FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Radio(
                      value: "Empty",
                      groupValue: _gasSelected,
                      onChanged: (value) {
                        setState(() {
                          _gasSelected = value as String;
                        });
                      },
                    ),
                  ),
                  const Text(
                    "Empty",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Radio(
                      value: "1/4",
                      groupValue: _gasSelected,
                      onChanged: (value) {
                        setState(() {
                          _gasSelected = value as String;
                        });
                      },
                    ),
                  ),
                  const Text(
                    "1/4",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Radio(
                      value: "1/2",
                      groupValue: _gasSelected,
                      onChanged: (value) {
                        setState(() {
                          _gasSelected = value as String;
                        });
                      },
                    ),
                  ),
                  const Text(
                    "1/2",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Radio(
                      value: "3/4",
                      groupValue: _gasSelected,
                      onChanged: (value) {
                        setState(() {
                          _gasSelected = value as String;
                        });
                      },
                    ),
                  ),
                  const Text(
                    "3/4",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Radio(
                      value: "Full",
                      groupValue: _gasSelected,
                      onChanged: (value) {
                        setState(() {
                          _gasSelected = value as String;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget documentsCheckButton() {
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
            "Documentos en resguardo",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 17.0),
          ),
          CheckboxListTile(
            title: const Text("Licencia de tránsito"),
            value: _checkedLicencia,
            onChanged: (bool? value) {
              setState(() {
                _checkedLicencia = value!;

                //asignación
                if (_checkedLicencia == true) {
                  documentslist.add("Licencia de tránsito");
                } else {
                  var checkeo = documentslist.contains("Licencia de tránsito");
                  checkeo ? documentslist.remove("Licencia de tránsito") : null;
                }
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
          CheckboxListTile(
            title: const Text("Soat"),
            value: _checkedSoat,
            onChanged: (bool? value) {
              setState(() {
                _checkedSoat = value!;

                //asignación
                if (_checkedLicencia) {
                  documentslist.add("Soat");
                } else {
                  var checkeo = documentslist.contains("Soat");
                  checkeo ? documentslist.remove("Soat") : null;
                }
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
          CheckboxListTile(
            title: const Text("Tecnomecánica"),
            value: _checkedTecno,
            onChanged: (bool? value) {
              setState(() {
                _checkedTecno = value!;

                //asignación
                if (_checkedLicencia) {
                  documentslist.add("Tecnomecánica");
                } else {
                  var checkeo = documentslist.contains("Tecnomecánica");
                  checkeo ? documentslist.remove("Tecnomecánica") : null;
                }
              });
            },
            activeColor: const Color(0xffBA5C0B),
          ),
        ],
      ),
    );
  }

  Widget advancePaymentCheckbox() {
    return Column(
      children: [
        CheckboxListTile(
          title: const Text("Anticipo"),
          subtitle: const Text("Indique el valor"),
          value: _checkedAnticipo,
          onChanged: (bool? value) {
            setState(() {
              _checkedAnticipo = value!;
              _reason.advancePayment = _checkedAnticipo;
            });
          },
          activeColor: const Color(0xffBA5C0B),
        ),
        if (_checkedAnticipo == true)
          TextFormField(
            //se pone azul al selecionarlo
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Ingrese valor";
              }
              if (value.contains(".") || value.contains(" ")) {
                return "Ingrese valor";
              }
              return null;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              // prefixIcon: const Icon(
              //   Icons.person,
              //   color: Color(0xffBA5C0B),
              // ),
              label: const Text(
                'Valor del anticipo',
              ),
              hintText: "Sin puntos o comas",
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
              _checkedAnticipo
                  ? _reason.advanceValue = int.tryParse(newValue!)!
                  : _reason.advanceValue = 0;
            },
          ),
      ],
    );
  }

//podría se un swich, pero que pereza.
  Widget authRuteCheckbox() {
    return CheckboxListTile(
      title: const Text("Autoriza ruta por cliente "),
      value: _checkedAutorizacion,
      onChanged: (bool? value) {
        _reason.authRute = value!;
        setState(() {
          _checkedAutorizacion = value;
        });
      },
      activeColor: const Color(0xffBA5C0B),
    );
  }

  Widget botonReason() {
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
        if (formKeyReason.currentState!.validate()) {
          formKeyReason.currentState!.save();
          try {
            //Botones sin controlador.
            _reason.lvlGas = _gasSelected;
            _reason.documents = documentslist;
            var msj = ScaffoldMessenger.of(context);

            await _controller.registerReason(widget.motorcycle!, _reason);

            msj.showSnackBar(
              const SnackBar(
                content: Text("El registro del motivo fue exitoso"),
              ),
            );
            widget.tabController!.animateTo(3);
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
