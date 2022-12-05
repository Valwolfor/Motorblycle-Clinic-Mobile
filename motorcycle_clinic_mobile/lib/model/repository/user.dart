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
    //el converte lo vuelve objeto, porque usa el factory
    final query = await _collectionReference
        .withConverter<UserEntity>(
          fromFirestore: UserEntity.fromFirestore,
          toFirestore: (value, options) => value.toFirestore(),
        )
        .where("email", isEqualTo: email)
        .get();
//el cast convierte los dato al formato toFirestore
    var users = query.docs.cast();

    if (users.isEmpty) {
      return Future.error("El usuario no existe.");
    }
    //Para recibir id de la BD
    var user = users.first;

    var response = user.data();
    response.id = user.id;

    return response;
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

  Future<void> savePhoto(String uid, String photo) async {
    await _collectionReference.doc(uid).set(
      {
        "photo": photo,
      },
      SetOptions(merge: true),
    );
  }

  Future<List<UserEntity>> getUserRecords() async {
    var query = await _collectionReference
        .withConverter<UserEntity>(
          fromFirestore: UserEntity.fromFirestore,
          toFirestore: (value, options) => value.toFirestore(),
        )
        .get();

    var users = query.docs.cast().map<UserEntity>((e) {
      var user = e.data();
      //Id de la moto en FS, no recuerdo pa qué.
      user.id = e.id;
      //buscar el mecánico

      return user;
    });

    return users.toList();
  }
}
