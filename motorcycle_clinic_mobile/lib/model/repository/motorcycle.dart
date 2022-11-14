import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:motorcycle_clinic_mobile/model/entity/customer.dart';

import '../entity/motorcycle.dart';

class MotorcycleRepository {
  late final CollectionReference _collection;

  MotorcycleRepository() {
    _collection = FirebaseFirestore.instance.collection("customer");
  }
  Future<void> newMotorcycle(MotorcycleEntity motorcycle) async {
    await _collection
        .withConverter(
            fromFirestore: MotorcycleEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .add(motorcycle);
  }
}
