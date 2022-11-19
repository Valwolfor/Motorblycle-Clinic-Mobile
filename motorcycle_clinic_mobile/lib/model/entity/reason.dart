import 'package:cloud_firestore/cloud_firestore.dart';

class ReasonEntity {
  late String? reason; //creo que es diferente por combo
  late String? reasonDetail; //creo que es diferente por combo
  late int? mileage;
  late String? gas;
  late Map<String, String>? documents;
  late bool? advancePayment;
  late int? advanceValue;
  late bool? authRute;

  ReasonEntity(
      {this.reason,
      this.reasonDetail,
      this.mileage,
      this.gas,
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
      gas: data?["gas"],
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
      if (gas != null && gas!.isNotEmpty) "gas": gas,
      // if (documents != null && model!.isNotEmpty) "model": documents, //sí puede ser null
      if (advancePayment != null) "advancePayment": advancePayment,
      if (advanceValue != null && advanceValue!.isNaN)
        "advanceValue": advanceValue,
      if (authRute != null) "authRute": authRute,
      //el primer ? es indicativo de null, el según el ?option.
    };
  }

  @override
  String toString() {
    return "ReasonEntity {$reason, $reasonDetail, $mileage, $gas, $advancePayment, $advanceValue, $authRute}";
  }
}
