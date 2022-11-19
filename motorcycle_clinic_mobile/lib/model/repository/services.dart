import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/customer.dart';

//TODO: todo
class ServiceRepository {
  late final CollectionReference _collection;

  ServiceRepository() {
    _collection = FirebaseFirestore.instance.collection("customer");
  }
  Future<void> newServices(CustomerEntity customer) async {
    await _collection
        .withConverter(
            fromFirestore: CustomerEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .add(customer);
    // .doc(customer.id)
    // .set(customer.toFirestore())
    // .onError((error, stackTrace) =>
    //     print("$error, con la siguente pila: $stackTrace"));
  }
}
