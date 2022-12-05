class MotorcycleResponse {
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

  MotorcycleResponse(
      {this.plate,
      this.idMotor,
      this.idchassis,
      this.brand,
      this.model,
      this.registerYear,
      this.idOwner,
      this.idUser,
      this.serviceOrdersMaps});
}
