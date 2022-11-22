import 'package:cloud_firestore/cloud_firestore.dart';

import '/controller/request/service_order_request.dart';

class MotorcycleEntity {
  late String? plate; //creo que es diferente por combo
  late String? idMotor;
  late String? idchassis;
  late String? brand;
  late String? model;
  late int? registerYear;
  late String? idOwner;
  late List<Map<String, dynamic>>? serviceOrdersList;

  MotorcycleEntity(
      {this.plate,
      this.idMotor,
      this.idchassis,
      this.brand,
      this.model,
      this.registerYear,
      this.idOwner,
      this.serviceOrdersList});
  //TODO: Organizar la orden de servicio

  //para obtener
  factory MotorcycleEntity.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    //devielve todos los datos en map consultados.

    var data = snapshot.data();
    return MotorcycleEntity(
        plate: data?["plate"],
        idMotor: data?["idMotor"],
        idchassis: data?["idchassis"],
        brand: data?["brand"],
        model: data?["model"],
        registerYear: data?["registerYear"],
        idOwner: data?["idOwner"],
        serviceOrdersList: [data?["serviceOrdersList"]]);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (plate != null && plate!.isNotEmpty) "plate": plate,
      if (idMotor != null && idMotor!.isNotEmpty) "idMotor": idMotor,
      if (idchassis != null && idchassis!.isNotEmpty) "idchassis": idchassis,
      if (brand != null && brand!.isNotEmpty) "brand": brand,
      if (model != null && model!.isNotEmpty) "model": model,
      if (registerYear != null && registerYear!.isNaN)
        "registerYear": registerYear,
      if (model != null && model!.isNotEmpty) "idOwner": idOwner,
      "serviceOrdersList": serviceOrdersList
      //el primer ? es indicativo de null, el según el ?option.
    };
  }

  @override
  String toString() {
    return "MotorcycleEntity {$plate, $idMotor, $idchassis, $brand, $model, $registerYear, $idOwner, $serviceOrdersList}";
  }
}
