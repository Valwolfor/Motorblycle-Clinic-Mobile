import '/model/entity/reason.dart';
import '/model/entity/motorcycle.dart';
import '/model/repository/motorcycle.dart';
import 'request/motorcycle_request.dart';
import 'request/plate_request.dart';
import 'request/reason_request.dart';
import 'request/service_order_request.dart';

class MotorcycleController {
  late final MotorcycleRepository _motorcycleRepository;
  MotorcycleController() {
    _motorcycleRepository = MotorcycleRepository();
  }

  Future<void> registerNewMotorcycle(MotorcycleRequest request) async {
    try {
      await _motorcycleRepository.findByPlate(request.plate!);

      return Future.error(
          "Ya existe una moto con la placa ${request.plate!} registrada");
    } catch (e) {
      //Agregar información a BD
      //Secciones
      // Map<String, dynamic> reasonMap = {
      //   "reason": request.serviceOrder!.reason?.reason,
      //   "mileage": request.serviceOrder!.reason?.mileage,
      //   "reasonDetail": request.serviceOrder!.reason?.reasonDetail,
      //   "lvlGas": request.serviceOrder!.reason?.lvlGas,
      //   "documents": request.serviceOrder!.reason?.documents,
      //   "advancePayment": request.serviceOrder!.reason?.advancePayment,
      //   "authRute": request.serviceOrder!.reason?.authRute,
      //   "advanceValue": request.serviceOrder!.reason?.advanceValue,
      // };

      Map<String, dynamic> serviceOrders;
      serviceOrders = {
        request.serviceOrder!.date!: {
          "date": request.serviceOrder!.date,
          "reason": {},
          "dx": {},
          "listServices": []
        },
      };

      _motorcycleRepository.newMotorcycle(
        MotorcycleEntity(
            plate: request.plate,
            idMotor: request.idMotor,
            idchassis: request.idchassis,
            brand: request.brand,
            model: request.model,
            registerYear: request.registerYear,
            idOwner: request.idOwner,
            serviceOrdersMaps: serviceOrders),
      );
    }
  }

//TODO: agregar nueva orden de servicio.
  //veriticar existencia del vehículo
  Future<MotorcycleRequest> getMotorcycle(PlateRequest request) async {
    var bike = await _motorcycleRepository.findByPlate(request.plate!);

    ServiceOrderRequest serviceOrder = ServiceOrderRequest();
    serviceOrder.date = bike.serviceOrder!.date;
    serviceOrder.reason = bike.serviceOrder!.reason;
    serviceOrder.dx = bike.serviceOrder!.dx;
    serviceOrder.listServices = bike.serviceOrder!.listServices;

    MotorcycleRequest motoRegistered = MotorcycleRequest();
    motoRegistered.plate = bike.plate;
    motoRegistered.idMotor = bike.idMotor;
    motoRegistered.idchassis = bike.idchassis;
    motoRegistered.brand = bike.brand;
    motoRegistered.model = bike.model;
    motoRegistered.registerYear = bike.registerYear;
    motoRegistered.idOwner = bike.idOwner;
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
}
