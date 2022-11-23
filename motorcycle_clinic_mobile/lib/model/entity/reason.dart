import 'package:cloud_firestore/cloud_firestore.dart';

class ReasonEntity {
  late String? reason;
  late String? reasonDetail;
  late int? mileage;
  late String? lvlGas;
  late List<String>? documents;
  late bool? advancePayment;
  late int? advanceValue;
  late bool? authRute;

  ReasonEntity(
      {this.reason,
      this.reasonDetail,
      this.mileage,
      this.lvlGas,
      this.documents,
      this.advancePayment,
      this.advanceValue,
      this.authRute});
  //TODO: agregar a la OS
  //para obtener
  factory ReasonEntity.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    //devielve todos los datos en map consultados.
    var data = snapshot.data();
    return ReasonEntity(
      reason: data?["reason"],
      reasonDetail: data?["reasonDetail"],
      mileage: data?["mileage"],
      lvlGas: data?["lvlGas"],
      documents: data?["documents"],
      advancePayment: data?["advancePayment"],
      advanceValue: data?["advanceValue"],
      authRute: data?["authRute"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (reason != null && reason!.isNotEmpty) "reason": reason,
      if (reasonDetail != null && reasonDetail!.isNotEmpty)
        "reasonDetail": reasonDetail,
      if (mileage != null && mileage!.isNaN) "mileage": mileage,
      if (lvlGas != null && lvlGas!.isNotEmpty) "lvlGas": lvlGas,
      if (advancePayment != null) "advancePayment": advancePayment,
      if (advanceValue != null && advanceValue!.isNaN)
        "advanceValue": advanceValue,
      if (authRute != null) "authRute": authRute,
    };
  }

  @override
  String toString() {
    return "ReasonEntity {$reason, $reasonDetail, $mileage, $lvlGas, $advancePayment, $advanceValue, $authRute}";
  }
}
