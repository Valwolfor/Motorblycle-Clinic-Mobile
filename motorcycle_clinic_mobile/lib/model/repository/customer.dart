import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/customer.dart';

class CustomerRepository {
  late final CollectionReference _collection;

  CustomerRepository() {
    _collection = FirebaseFirestore.instance.collection("customers");
  }
  Future<void> newCustomer(CustomerEntity customer) async {
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

  Future<CustomerEntity> findById(String idQuery) async {
    //el idQuery el la entidad que se manda "email"
    //el converte lo vuelve objeto, porque usa el factory
    final query = await _collection
        .withConverter(
          fromFirestore: CustomerEntity.fromFirestore,
          toFirestore: (value, options) => value.toFirestore(),
        )
        .where("id", isEqualTo: idQuery)
        .get();
//el cast convierte los dato al formato toFirestore
    var customer = query.docs.cast();

    if (customer.isEmpty) {
      return Future.error("El cliente no se encuentra registrado.");
    }
    //Para recibir id de la BD
    var id = customer[0];

    var response = id.data();
    // response.idC = id.idC;

    return response;
  }
}
