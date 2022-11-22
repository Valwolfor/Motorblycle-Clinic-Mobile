import '/model/entity/motorcycle.dart';
import '/model/repository/motorcycle.dart';
import 'request/motorcycle_request.dart';
import 'request/plate_request.dart';

class MotorcycleController {
  late final MotorcycleRepository _customerRepository;
  MotorcycleController() {
    _customerRepository = MotorcycleRepository();
  }

  Future<void> registerNewMotorcycle(MotorcycleRequest request) async {
    //Agregar información a BD
    List<Map<String, dynamic>> serviceOrdersList = [];
    serviceOrdersList.add({
      "date": request.serviceOrder!.date,
      "reason": request.serviceOrder!.reason,
      "mileage": request.serviceOrder!.mileage,
      "reasonDetail": request.serviceOrder!.reasonDetail,
      "lvlGas": request.serviceOrder!.lvlGas,
      "documents": request.serviceOrder!.documents,
      "advancePayment": request.serviceOrder!.advancePayment,
      "authRute": request.serviceOrder!.authRute,
      "advanceValue": request.serviceOrder!.advanceValue,
      "indicators": request.serviceOrder!.indicators,
      "oilState": request.serviceOrder!.oilState,
      "oilLvl": request.serviceOrder!.oilLvl,
      "brakeFluid": request.serviceOrder!.brakeFluid,
      "cluchtFluid": request.serviceOrder!.cluchtFluid,
      "coolantFluid": request.serviceOrder!.coolantFluid,
      "mirrows": request.serviceOrder!.mirrows,
      "horm": request.serviceOrder!.horm,
      "tank": request.serviceOrder!.tank,
      "ligths": request.serviceOrder!.ligths,
      "tires": request.serviceOrder!.tires,
      "forwardBrake": request.serviceOrder!.forwardBrake,
      "backBrake": request.serviceOrder!.backBrake,
      "clucht": request.serviceOrder!.clucht,
      "chain": request.serviceOrder!.chain,
      "sparkPlug": request.serviceOrder!.sparkPlug,
      "batery": request.serviceOrder!.batery,
      "motor": request.serviceOrder!.motor,
      "tapes": request.serviceOrder!.tapes,
      "dragKit": request.serviceOrder!.dragKit,
      "listServices": request.serviceOrder!.listServices,
    });
    _customerRepository.newMotorcycle(
      MotorcycleEntity(
          plate: request.plate,
          idMotor: request.idMotor,
          idchassis: request.idchassis,
          brand: request.brand,
          model: request.model,
          registerYear: request.registerYear,
          idOwner: request.idOwner,
          serviceOrdersList: serviceOrdersList),
    );
  }

  //veriticar existencia del vehículo
  Future<PlateRequest> getMotorcycle(PlateRequest request) async {
    var bike = await _customerRepository.findByPlate(request.plate!);

    // var nameUser = "${user.name} ${user.lastName}";
    return PlateRequest(
      plate: bike.plate,
    );
  }
}
