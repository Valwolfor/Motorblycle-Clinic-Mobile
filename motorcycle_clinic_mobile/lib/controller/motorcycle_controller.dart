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
    //Secciones
    Map<String, dynamic> reasonMap = {
      "reason": request.serviceOrder!.reason?.reason,
      "mileage": request.serviceOrder!.reason?.mileage,
      "reasonDetail": request.serviceOrder!.reason?.reasonDetail,
      "lvlGas": request.serviceOrder!.reason?.lvlGas,
      "documents": request.serviceOrder!.reason?.documents,
      "advancePayment": request.serviceOrder!.reason?.advancePayment,
      "authRute": request.serviceOrder!.reason?.authRute,
      "advanceValue": request.serviceOrder!.reason?.advanceValue,
    };

    Map<String, dynamic> dxMap = {
      "indicators": request.serviceOrder!.dx?.indicators,
      "oilState": request.serviceOrder!.dx?.oilState,
      "oilLvl": request.serviceOrder!.dx?.oilLvl,
      "brakeFluid": request.serviceOrder!.dx?.brakeFluid,
      "cluchtFluid": request.serviceOrder!.dx?.cluchtFluid,
      "coolantFluid": request.serviceOrder!.dx?.coolantFluid,
      "mirrows": request.serviceOrder!.dx?.mirrows,
      "horm": request.serviceOrder!.dx?.horm,
      "tank": request.serviceOrder!.dx?.tank,
      "ligths": request.serviceOrder!.dx?.ligths,
      "tires": request.serviceOrder!.dx?.tires,
      "forwardBrake": request.serviceOrder!.dx?.forwardBrake,
      "backBrake": request.serviceOrder!.dx?.backBrake,
      "clucht": request.serviceOrder!.dx?.clucht,
      "chain": request.serviceOrder!.dx?.chain,
      "sparkPlug": request.serviceOrder!.dx?.sparkPlug,
      "batery": request.serviceOrder!.dx?.batery,
      "motor": request.serviceOrder!.dx?.motor,
      "tapes": request.serviceOrder!.dx?.tapes,
      "dragKit": request.serviceOrder!.dx?.dragKit,
    };

    List<Map<String, dynamic>> serviceOrdersList = [];
    serviceOrdersList.add({
      "date": request.serviceOrder!.date,
      "reason": reasonMap,
      // "reason": request.serviceOrder!.reason!.reason,
      // "mileage": request.serviceOrder!.reason!.mileage,
      // "reasonDetail": request.serviceOrder!.reason!.reasonDetail,
      // "lvlGas": request.serviceOrder!.reason!.lvlGas,
      // "documents": request.serviceOrder!.reason!.documents,
      // "advancePayment": request.serviceOrder!.reason!.advancePayment,
      // "authRute": request.serviceOrder!.reason!.authRute,
      // "advanceValue": request.serviceOrder!.reason!.advanceValue,
      "dx": dxMap,
      // "indicators": request.serviceOrder!.dx!.indicators,
      // "oilState": request.serviceOrder!.dx!.oilState,
      // "oilLvl": request.serviceOrder!.dx!.oilLvl,
      // "brakeFluid": request.serviceOrder!.dx!.brakeFluid,
      // "cluchtFluid": request.serviceOrder!.dx!.cluchtFluid,
      // "coolantFluid": request.serviceOrder!.dx!.coolantFluid,
      // "mirrows": request.serviceOrder!.dx!.mirrows,
      // "horm": request.serviceOrder!.dx!.horm,
      // "tank": request.serviceOrder!.dx!.tank,
      // "ligths": request.serviceOrder!.dx!.ligths,
      // "tires": request.serviceOrder!.dx!.tires,
      // "forwardBrake": request.serviceOrder!.dx!.forwardBrake,
      // "backBrake": request.serviceOrder!.dx!.backBrake,
      // "clucht": request.serviceOrder!.dx!.clucht,
      // "chain": request.serviceOrder!.dx!.chain,
      // "sparkPlug": request.serviceOrder!.dx!.sparkPlug,
      // "batery": request.serviceOrder!.dx!.batery,
      // "motor": request.serviceOrder!.dx!.motor,
      // "tapes": request.serviceOrder!.dx!.tapes,
      // "dragKit": request.serviceOrder!.dx!.dragKit,

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
