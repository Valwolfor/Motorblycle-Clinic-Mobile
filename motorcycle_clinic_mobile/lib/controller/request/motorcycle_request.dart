import 'service_order_request.dart';

class MotorcycleRequest {
  //se usa el late cuando se está seguro que se llenarán todos los campos
  late String? plate;
  late String? idMotor;
  late String? idchassis;
  late String? brand;
  late String? model;
  late int? registerYear;
  late String? idOwner;
  late String? idUser;
  late ServiceOrderRequest? serviceOrder;

  @override
  String toString() {
    return "$plate, $idMotor, $idchassis, $brand, $model, $registerYear, $idOwner, $idUser, $serviceOrder ";
  }
}
