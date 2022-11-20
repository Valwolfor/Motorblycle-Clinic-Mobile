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

    _customerRepository.newMotorcycle(
      MotorcycleEntity(
          plate: request.plate,
          idMotor: request.idMotor,
          idchassis: request.idchassis,
          brand: request.brand,
          model: request.model,
          registerYear: request.registerYear,
          idOwner: request.idOwner,
          serviceOrders: request.serviceOrders),
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
