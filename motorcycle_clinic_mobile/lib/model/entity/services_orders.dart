import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceOrdenEntity {
//TODO: hacer todo lo de la ordeN
  late String? indicators;
  late String? oilState;
  late String? oilLvl;
  late String? brakeFluid;
  late String? clutchFluid;
  late String? coolantFluid;
  late String? mirrows;
  late String? horm;
  late String? tank;
  late Map<String, String>? ligths;
  late Map<String, String>? tires;
  late String? frontBrake;
  late String? backBrake;
  late String? clutch;
  late String? chain;
  late String? sparkPlug;
  late String? batery;
  late String? motor;
  late String? tapes;
  late String? dragKit;
  late String? detailDx;

  ServiceOrdenEntity(
      {this.indicators,
      this.oilState,
      this.oilLvl,
      this.brakeFluid,
      this.clutchFluid,
      this.coolantFluid,
      this.mirrows,
      this.horm,
      this.tank,
      this.ligths,
      this.tires,
      this.frontBrake,
      this.backBrake,
      this.clutch,
      this.chain,
      this.sparkPlug,
      this.batery,
      this.motor,
      this.tapes,
      this.dragKit,
      this.detailDx});

  //TODO: agregar a la OS
  //para obtener
  factory ServiceOrdenEntity.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    //devielve todos los datos en map consultados.
    var data = snapshot.data();
    return ServiceOrdenEntity(
      indicators: data?["indicators"],
      oilState: data?["oilState"],
      oilLvl: data?["oilLvl"],
      brakeFluid: data?["brakeFluid"],
      clutchFluid: data?["clutchFluid"],
      coolantFluid: data?["coolantFluid"],
      mirrows: data?["mirrows"],
      horm: data?["horm"],
      tank: data?["tank"],
      ligths: data?["ligths"],
      tires: data?["tires"],
      frontBrake: data?["frontBrake"],
      backBrake: data?["backBrake"],
      clutch: data?["hoclutchrm"],
      chain: data?["chain"],
      sparkPlug: data?["sparkPlug"],
      batery: data?["batery"],
      motor: data?["motor"],
      tapes: data?["tapes"],
      dragKit: data?["dragKit"],
      detailDx: data?["detailDx"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "indicators": indicators,
      "oilState": oilState,
      "oilLvl": oilLvl,
      "brakeFluid": brakeFluid,
      "clutchFluid": clutchFluid,
      "coolantFluid": coolantFluid, "mirrows": mirrows, "horm": horm,
      "tank": tank,
      "frontBrake": frontBrake, "backBrake": backBrake, "clutch": clutch,
      "chain": chain,
      "sparkPlug": sparkPlug, "batery": batery,
      "motor": motor, "tapes": tapes, "dragKit": dragKit,
      if (detailDx != null && detailDx!.isNotEmpty) "detailDx": detailDx,
      //el primer ? es indicativo de null, el según el ?option.
    };
  }

  @override
  String toString() {
    return "ServiceOrdenEntity {$indicators, $oilState, $oilLvl, $brakeFluid, $clutchFluid, $coolantFluid, $mirrows, $horm, $tank, $frontBrake, $backBrake, $clutch, $chain, $sparkPlug, $batery, $motor, $tapes, $detailDx,}";
  }
}
