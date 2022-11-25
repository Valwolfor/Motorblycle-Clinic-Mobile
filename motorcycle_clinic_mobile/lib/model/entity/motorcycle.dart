import 'package:cloud_firestore/cloud_firestore.dart';

class MotorcycleEntity {
  late String? id;
  late String? plate; //creo que es diferente por combo
  late String? idMotor;
  late String? idchassis;
  late String? brand;
  late String? model;
  late int? registerYear;
  late String? idOwner;
  late String? idUser;
  late Map<String, dynamic>? serviceOrdersMaps;

  MotorcycleEntity(
      {this.plate,
      this.idMotor,
      this.idchassis,
      this.brand,
      this.model,
      this.registerYear,
      this.idOwner,
      this.idUser,
      this.serviceOrdersMaps});

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
        idUser: data?["idUser"],
        serviceOrdersMaps: data?["serviceOrdersMaps"]);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (plate != null || plate!.isNotEmpty) "plate": plate,
      if (idMotor != null || idMotor!.isNotEmpty) "idMotor": idMotor,
      if (idchassis != null || idchassis!.isNotEmpty) "idchassis": idchassis,
      if (brand != null || brand!.isNotEmpty) "brand": brand,
      if (model != null || model!.isNotEmpty) "model": model,
      if (registerYear != null || registerYear!.isNaN)
        "registerYear": registerYear,
      if (idOwner != null || idOwner!.isNotEmpty) "idOwner": idOwner,
      if (idUser != null || idUser!.isNotEmpty) "idUser": idUser,
      "serviceOrdersMaps": serviceOrdersMaps
      //el primer ? es indicativo de null, el según el ?option.
    };
  }

  @override
  String toString() {
    return "MotorcycleEntity {$plate, $idMotor, $idchassis, $brand, $model, $registerYear, $idOwner, $idUser, $serviceOrdersMaps}";
  }
}
