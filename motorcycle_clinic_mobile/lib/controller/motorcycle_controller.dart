import 'package:motorcycle_clinic_mobile/model/repository/user.dart';

import '../model/entity/services.dart';
import '/model/entity/dx.dart';
import '/model/entity/reason.dart';
import '/model/entity/motorcycle.dart';
import '/model/repository/motorcycle.dart';
import 'request/dx_request.dart';
import 'request/motorcycle_request.dart';
import 'request/reason_request.dart';
import 'request/service_order_request.dart';
import 'response/list_motos_response.dart';

class MotorcycleController {
  late final MotorcycleRepository _motorcycleRepository;
  late final UserRepository _userRepository;
  MotorcycleController() {
    _motorcycleRepository = MotorcycleRepository();
    _userRepository = UserRepository();
  }

  Future<void> registerNewMotorcycle(MotorcycleRequest request) async {
    int index;
    var query;

    query = await _motorcycleRepository.findLength(request.plate!);

    if (query == 0) {
      index = 1;
    } else {
      query += 1;
      index = int.parse(query) + 1;
    }

    try {
      await _motorcycleRepository.findByPlate(request.plate!);

      return Future.error(
          "Ya existe una moto con la placa ${request.plate!} registrada");
    } catch (e) {
      //Agregar información a BD
      //Secciones
      Map<String, dynamic> serviceOrders;
      serviceOrders = {
        "date": request.serviceOrder!.date,
        "reason": {},
        "dx": {},
        "listServices": []
      };

      String key = index.toString();
      Map<String, Map<String, dynamic>>? serviceOrdersMaps = {};
      serviceOrdersMaps[key] = serviceOrders;

      _motorcycleRepository.newMotorcycle(
        MotorcycleEntity(
            plate: request.plate,
            idMotor: request.idMotor,
            idchassis: request.idchassis,
            brand: request.brand,
            model: request.model,
            registerYear: request.registerYear,
            idOwner: request.idOwner,
            idUser: request.idUser,
            serviceOrdersMaps: serviceOrdersMaps),
      );
    }
  }

  //veriticar existencia del vehículo y agrega nueva OS
  Future<MotorcycleRequest> getMotorcycle(MotorcycleRequest request) async {
    var bike = await _motorcycleRepository.findByPlate(request.plate!);

    ServiceOrderRequest serviceOrder = ServiceOrderRequest();
    serviceOrder.date = "";
    serviceOrder.reason = <String, dynamic>{};
    serviceOrder.dx = <String, dynamic>{};
    serviceOrder.listServices = [<String, dynamic>{}];

    MotorcycleRequest motoRegistered = MotorcycleRequest();
    motoRegistered.plate = bike.plate;
    motoRegistered.idMotor = bike.idMotor;
    motoRegistered.idchassis = bike.idchassis;
    motoRegistered.brand = bike.brand;
    motoRegistered.model = bike.model;
    motoRegistered.registerYear = bike.registerYear;
    motoRegistered.idOwner = bike.idOwner;
    motoRegistered.idUser = request.idUser;
    motoRegistered.serviceOrder = serviceOrder;

    return motoRegistered;
  }

  //Agregado de motivo de ingreso.
  Future<void> registerReason(
      MotorcycleRequest requestMoto, ReasonRequest request) async {
    _motorcycleRepository.addReason(
      ReasonEntity(
          reason: request.reason,
          reasonDetail: request.reasonDetail,
          mileage: request.mileage,
          lvlGas: request.lvlGas,
          documents: request.documents,
          advancePayment: request.advancePayment,
          advanceValue: request.advanceValue,
          authRute: request.authRute),
      requestMoto,
    );
  }

  //agregando el Dx
  Future<void> registerDx(
      MotorcycleRequest motoRequest, DxRequest dxRequest) async {
    _motorcycleRepository.addDx(
      DxEntity(
          indicators: dxRequest.indicators,
          oilState: dxRequest.oilState,
          oilLvl: dxRequest.oilLvl,
          brakeFluid: dxRequest.brakeFluid,
          clutchFluid: dxRequest.cluchtFluid,
          coolantFluid: dxRequest.coolantFluid,
          mirrows: dxRequest.mirrows,
          horm: dxRequest.horm,
          tank: dxRequest.tank,
          ligths: dxRequest.ligths,
          tires: dxRequest.tires,
          frontBrake: dxRequest.forwardBrake,
          backBrake: dxRequest.backBrake,
          clutch: dxRequest.clucht,
          chain: dxRequest.chain,
          sparkPlug: dxRequest.sparkPlug,
          batery: dxRequest.batery,
          motor: dxRequest.motor,
          tapes: dxRequest.tapes,
          dragKit: dxRequest.dragKit,
          detailDx: dxRequest.detailDx),
      motoRequest,
    );
  }

  Future<void> registerServices(MotorcycleRequest motorcycleRequest) async {
    _motorcycleRepository.addServices(
      ServicesEntity(services: motorcycleRequest.serviceOrder!.listServices),
      motorcycleRequest,
    );
  }

  Future<List<MotorcycleResponse>> displayMotorcycle() async {
    var listMotos = await _motorcycleRepository.getMotorcycleRecords();
    var listUsers = await _userRepository.getUserRecords();
    MotorcycleResponse moto;

    var motorclycles = listMotos.map<MotorcycleResponse>((m) {
      //mete el repository en los request
      moto = MotorcycleResponse();
      moto.id = m.id;
      moto.plate = m.plate;
      moto.idMotor = m.idMotor;
      moto.idchassis = m.idchassis;
      moto.brand = m.brand;
      moto.model = m.model;
      moto.registerYear = m.registerYear;
      moto.idOwner = m.idOwner;
      //pone el nombre de mecánico en vez de id
      for (var u in listUsers) {
        if (u.id == m.idUser) {
          moto.idUser = "${u.lastName}";
          break;
        }
      }
      moto.serviceOrdersMaps = m.serviceOrdersMaps;

      return moto;
    }).toList();

    return motorclycles;
  }
}
