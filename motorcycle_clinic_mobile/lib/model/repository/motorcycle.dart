import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/motorcycle.dart';

class MotorcycleRepository {
  late final CollectionReference _collection;

  MotorcycleRepository() {
    _collection = FirebaseFirestore.instance.collection("motorcycle");
  }
  Future<void> newMotorcycle(MotorcycleEntity motorcycle) async {
    await _collection
        .withConverter(
            fromFirestore: MotorcycleEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .add(motorcycle);
    // .doc(motorcycle.plate)
    // .set(motorcycle.toFirestore())
    // .onError((error, stackTrace) =>
    //     print("$error, con la siguente pila: $stackTrace"));
  }

  Future<MotorcycleEntity> findByPlate(String plateQuery) async {
    final query = await _collection
        .withConverter(
          fromFirestore: MotorcycleEntity.fromFirestore,
          toFirestore: (value, options) => value.toFirestore(),
        )
        .where("plate", isEqualTo: plateQuery)
        .get();
//el cast convierte los dato al formato toFirestore
    var motorclycle = query.docs.cast();

    if (motorclycle.isEmpty) {
      return Future.error("La no se encuentra registrada.");
    }
    //Para recibir id de la BD
    var plate = motorclycle[0];

    var response = plate.data();
    // response.idC = id.idC;

    return response;
  }
}
