import 'package:cloud_firestore/cloud_firestore.dart';

class MotorcycleEntity {
  late String? plate; //creo que es diferente por combo
  late String? idMotor;
  late String? idchassis;
  late String? brand;
  late String? model;
  late int? registerYear;

  MotorcycleEntity(
      {this.plate,
      this.idMotor,
      this.idchassis,
      this.brand,
      this.model,
      this.registerYear});

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
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (plate != null && plate!.isNotEmpty) "plate": plate,
      if (idMotor != null && idMotor!.isNotEmpty) "idMotor": idMotor,
      if (idchassis != null && idchassis!.isNotEmpty) "idchassis": idchassis,
      if (brand != null && brand!.isNotEmpty) "brand": brand,
      if (model != null && model!.isNotEmpty) "model": model,
      if (registerYear != null && registerYear!.isNaN)
        "phoneNumber": registerYear
      //el primer ? es indicativo de null, el según el ?option.
    };
  }

  @override
  String toString() {
    return "UserEntity {$plate, $idMotor, $idchassis, $brand, $model, $registerYear}";
  }
}
