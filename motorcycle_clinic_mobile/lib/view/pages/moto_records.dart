import 'package:flutter/material.dart';

import '/controller/response/list_motos_response.dart';
import '/controller/motorcycle_controller.dart';
import '../widgets/app_bar_menu.dart';
import '../widgets/drawer_admin.dart';
import '../widgets/logo.dart';
import 'detail_motorview.dart';

class MotorcycleRecords extends StatefulWidget {
  const MotorcycleRecords({super.key});

  @override
  State<MotorcycleRecords> createState() => _MotorcycleRecordsState();
}

class _MotorcycleRecordsState extends State<MotorcycleRecords> {
  List<MotorcycleResponse> _list = [];
  final _controller = MotorcycleController();

  // final _prefs = SharedPreferences.getInstance(); // para cuando se haga por usuario
  @override
  void initState() {
    super.initState();
    //TODO pref para listar por user de app.
// _prefs.then((pref){const id = pref.getString("uid");
// También aquí se mete la variable de id al controller });
    _controller.displayMotorcycle().then((value) {
      setState(() {
        _list = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: (() async {
        return false;
      }),
      child: Scaffold(
        // key: scaffoldKey,
        backgroundColor: const Color(0xffFEFAE0),
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 30.0,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            },
          ),
          title: const Center(
              child: Text(
            "Histórico de motos",
            style: TextStyle(fontSize: 20.0),
          )),
          backgroundColor: const Color(0xff4D581C),
          actions: const <Widget>[
            AppBMenu(),
          ],
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
            ),
            child: Column(
              children: [
                const Center(
                  child: Logo(),
                ),
                //TODO: buscar entre registro: selecionar lista con if en donde se pone la lista
                const Center(
                  child: Text(
                    "Registro de todas las motos ingresadas.",
                    style: TextStyle(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xffBA5C0B),
                      ),
                      borderRadius: BorderRadius.circular(15.0)),
                  height: size.height * 0.35,
                  child: listBuilderMotos(),
                ),
              ],
            )),
        drawer: const DrawerAdmin(),
      ),
    );
  }

  Widget listBuilderMotos() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _list.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.black,
            child: tileMotos(index),
          ),
        );
      },
    );
  }

  Widget tileMotos(int index) {
    return ListTile(
      tileColor: const Color(0xffFEFAE0),
      title: Text(_list[index].plate!),
      subtitle: Text(
        _list[index].idOwner!,
        style: const TextStyle(fontSize: 12.0),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      leading: const Icon(
        Icons.sports_motorsports,
        color: Color(0xff4D581C),
        size: 35.0,
      ),
      trailing: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text("${_list[index].brand!}, ${_list[index].model!}"),
                Text(
                  _list[index].idUser!,
                  style: const TextStyle(fontSize: 12.0),
                ),
                //todo: VALIDAR con nombre nuevo método.
              ],
            ),
            //TODO: futuro, verificar si está en taller. con alert de confirm
            //TODO: y bloqueo si confirmación recibe el true desde BD al registrarlos, todos tienen por defecto esto
            // Switch(
            // This bool value toggles the switch.
            // value: _isChecked[indexTile],
            // activeColor: const Color(0xffBA5C0B),
            // onChanged: (bool value) {
            // This is called when the user toggles the switch.
            // _listServices![indexTile]["Aprobacion"] = value;
            // _isChecked[indexTile] = _listServices![indexTile]["Aprobacion"];
            // setState(() {
            //   _isChecked[indexTile];
            // }, value: null,);
            // },
            // )
          ],
        ),
      ),
      onLongPress: () {
        var moto = _list[index];

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailMotorcycle(moto: moto),
          ),
        );
      },
    );
  }
}
