import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/user.dart';

class UserRepository {
  late final FirebaseFirestore db;

  UserRepository() {
    //Para acceder a la BD
    db = FirebaseFirestore.instance;
  }

  UserEntity findByEmail(String email) {
    // var user = _users[email];

    // if (user == null) {
    //   throw Exception("El usuario no existe.");
    // }
    return UserEntity();
  }

  Future<void> save(UserEntity user) async {
    //Le da nombre a la colección, la crea.
    await db
        .collection("users")
        .doc(user.email)
        .set(user.toFirestore())
        .onError((error, stackTrace) =>
            print("$error, con la siguente pila: $stackTrace"));
  }
}
