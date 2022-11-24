import 'package:cloud_firestore/cloud_firestore.dart';

class ServicesEntity {
  late List<Map<String, dynamic>>? services;

  ServicesEntity({
    this.services,
  });

  //para obtener
  factory ServicesEntity.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    //devielve todos los datos en map consultados.
    var data = snapshot.data();
    return ServicesEntity(
      services: data?["services"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "services": services,
    };
  }

  @override
  String toString() {
    return "ServiceOrdenEntity {$services}";
  }
}
