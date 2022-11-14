import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/user.dart';

class UserRepository {
  late final CollectionReference _collectionReference;

  UserRepository() {
    //Para acceder a la BD
    _collectionReference = FirebaseFirestore.instance.collection("users");
  }

  Future<UserEntity> findByEmail(String email) async {
    //el value el la entidad que se manda "email"
    final query = await _collectionReference
        .withConverter(
          fromFirestore: UserEntity.fromFirestore,
          toFirestore: (value, options) => value.toFirestore(),
        )
        .where("email", isEqualTo: email)
        .get();
//el cast convierte los dato al formato toFirestore
    var users = query.docs.cast().map((e) => e.data());

    if (users.isEmpty) {
      return Future.error("El usuario no existe.");
    }
    return users.first;
  }

  Future<void> save(UserEntity user) async {
    //Le da nombre a la colección, la crea.
    //add(user.toFirestore());
    await _collectionReference
        .withConverter(
          fromFirestore: UserEntity.fromFirestore,
          toFirestore: (value, options) => value.toFirestore(),
        )
        .add(user);
    // .doc(user.email).set(user.toFirestore()).onError(
    //     (error, stackTrace) =>
    //         print("$error, con la siguente pila: $stackTrace"));
  }
}
