import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/customer.dart';

class CustomerRepository {
  late final CollectionReference _collection;

  CustomerRepository() {
    _collection = FirebaseFirestore.instance.collection("customer");
  }
  Future<void> newCustomer(CustomerEntity customer) async {
    await _collection
        .withConverter(
            fromFirestore: CustomerEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .add(customer);
  }
}
