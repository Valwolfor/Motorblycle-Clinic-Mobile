import 'package:flutter/material.dart';

import '/widgets/my_drawer.dart';
import '/widgets/app_bar_menu.dart';
import 'cliente_tab_register.dart';
import 'dx_tab_register.dart';
import 'motivo_tab_register.dart';
import 'moto_tab_register.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Motorcycle Clinic App",
      debugShowCheckedModeBanner: false,
      home: RegisterBikecycle(),
    );
  }
}

class RegisterBikecycle extends StatefulWidget {
  const RegisterBikecycle({super.key});

  @override
  State<RegisterBikecycle> createState() => _RegisterBikecycleState();
}

class _RegisterBikecycleState extends State<RegisterBikecycle>
    with SingleTickerProviderStateMixin {
  //el with es para darle contexto al this.
  int selectedPage = 0;
  //No sé para que esel ScaffoldState
  final scaffoldKey = GlobalKey<ScaffoldState>();
  //controllers
  late TabController _tabController;

  //para que se cree la pantalla
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, initialIndex: selectedPage, length: 5);
  }

  //Para cerrar la pantalla.
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xffFEFAE0),
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Registro de motos",
          style: TextStyle(fontSize: 23.0),
        )),
        backgroundColor: const Color(0xff4D581C),
        actions: const <Widget>[
          AppBMenu(),
        ],
      ),
      body: bodyTabs(),
      drawer: myDrawer(context), //TODO: hacerle el drawer propio
    );
  }

  Widget bodyTabs() {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 2.0,
                color: Color(0xffBA5C0B),
              ),
            ),
          ),
          padding: const EdgeInsets.only(top: 10.0), //aquí estab el scroll
          child: TabBar(
            indicator: const BoxDecoration(
              color: Color(0xff5DA767),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            indicatorColor: const Color(0xffBA5C0B), // elevation: 5,
            labelColor: Colors.black,
            controller: _tabController,
            tabs: <Tab>[
              Tab(
                child: iconCustomer(),
              ),
              Tab(
                child: iconMoto(),
              ),
              Tab(
                child: iconReason(),
              ),
              Tab(
                child: iconDx(),
              ),
              Tab(
                child: iconServices(),
              ),
            ],
          ),
        ),
        tabViewRegister(),
      ],
    );
  }

  //Iconos de las tabs
  Widget iconCustomer() {
    return const Material(
      color: Color(0x00FEFAE0),
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Icon(
        Icons.person,
        color: Color(0xffBA5C0B),
        size: 42.0,
      ),
    );
  }

  Widget iconMoto() {
    return const Material(
      color: Color(0x00FEFAE0),
      child: Icon(
        Icons.motorcycle_rounded,
        color: Color(0xffBA5C0B),
        size: 42.0,
      ),
    );
  }

  Widget iconReason() {
    return const Material(
      color: Color(0x00FEFAE0),
      child: Icon(
        Icons.question_mark,
        color: Color(0xffBA5C0B),
        size: 45.0,
      ),
    );
  }

  Widget iconDx() {
    return const Material(
      color: Color(0x00FEFAE0),
      child: Icon(
        Icons.medical_services_outlined,
        color: Color(0xffBA5C0B),
        size: 42.0,
      ),
    );
  }

  Widget iconServices() {
    return const Material(
      color: Color(0x00FEFAE0),
      child: Icon(
        Icons.home_repair_service_sharp,
        color: Color(0xffBA5C0B),
        size: 42.0,
      ),
    );
  }

  //Contenedor vitas de las Tabs
  Widget tabViewRegister() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          const SingleChildScrollView(
            child: ViewCliente(),
          ),
          const SingleChildScrollView(
            child: ViewMoto(),
          ),
          const SingleChildScrollView(
            child: ViewMotivo(),
          ),
          const SingleChildScrollView(
            child: ViewDx(),
          ),
          SingleChildScrollView(child: Column()),
        ],
      ),
    );
  }
}
