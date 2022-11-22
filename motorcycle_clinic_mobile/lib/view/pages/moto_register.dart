import 'package:flutter/material.dart';

import '/controller/request/service_order_request.dart';
import '/controller/request/motorcycle_request.dart';
import '/controller/request/plate_request.dart';
import '/controller/request/id_request.dart';
import '../widgets/app_bar_menu.dart';
import '../widgets/drawer_admin.dart';
import 'tabs/customer_tab_register.dart';
import 'tabs/dx_tab_register.dart';
import 'tabs/reason_tab_register.dart';
import 'tabs/motorcycle_tab_register.dart';
import 'tabs/services_tab_register.dart';

class RegisterMotorcycle extends StatefulWidget {
  const RegisterMotorcycle({super.key});

  @override
  State<RegisterMotorcycle> createState() => _RegisterMotorcycleState();
}

class _RegisterMotorcycleState extends State<RegisterMotorcycle>
    with SingleTickerProviderStateMixin {
  //el with es para darle contexto al this.
  int selectedPage = 0;
  //TODO:No sé para que es el ScaffoldState
  final scaffoldKey = GlobalKey<ScaffoldState>();
  //controllers
  TabController? _tabController;

//TODO: arreglar lode la orden de servicio
  MotorcycleRequest? _motorcycleRequest;
  ServiceOrderRequest? _serviceOrderRequest;
  IdRequest? _idCustomer;
  PlateRequest? _plateRequest;
  //para que se cree la pantalla
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, initialIndex: selectedPage, length: 5);
    _idCustomer = IdRequest();
    _plateRequest = PlateRequest();
    _motorcycleRequest = MotorcycleRequest();
    _serviceOrderRequest = ServiceOrderRequest();
  }

  //Para cerrar la pantalla.
  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() async {
        return false;
      }),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xffFEFAE0),
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 32.0,
                ),
                onPressed: () => Scaffold.of(context)
                    .openDrawer(), //función que llama al drawer.
              );
            },
          ),
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
        drawer: const DrawerAdmin(), //TODO: hacerle el drawer propio
      ),
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
          padding: const EdgeInsets.only(top: 10.0),
          //Para evitar la funcionalidad de los botones de las tabs
          child: IgnorePointer(
            ignoring: false,
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
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: ViewCustomer(
                tabController: _tabController, idCustomer: _idCustomer),
          ),
          SingleChildScrollView(
            child: ViewMoto(
              tabController: _tabController,
              motorcycle: _motorcycleRequest,
              serviceOrder: _serviceOrderRequest,
              idCustomerM: _idCustomer,
              plate: _plateRequest,
            ),
          ),
          SingleChildScrollView(
            child: ViewReason(
                tabController: _tabController,
                motorcycle: _motorcycleRequest,
                serviceOrder: _serviceOrderRequest),
          ),
          SingleChildScrollView(
            child: ViewDx(
                tabController: _tabController,
                motorcycle: _motorcycleRequest,
                serviceOrder: _serviceOrderRequest),
          ),
          SingleChildScrollView(
            //TODO: motivo y dx
            child: ViewServicios(
                tabController: _tabController,
                motorcycle: _motorcycleRequest,
                serviceOrder: _serviceOrderRequest),
          ),
        ],
      ),
    );
  }
}
