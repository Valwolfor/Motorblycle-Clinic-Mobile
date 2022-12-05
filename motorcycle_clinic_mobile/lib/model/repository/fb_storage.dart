import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageRepository {
  late final FirebaseStorage _storage;

  FirebaseStorageRepository() {
    _storage = FirebaseStorage.instanceFor(
        bucket: "gs://motorcycle-clinic.appspot.com");
  }

  Future<String> loadFile(String filePath, String colection) async {
    final file = File(filePath);

//Esto le suma uno para contar después del /, ese valor se agrega al subString
    final index = filePath.lastIndexOf("/") + 1;
    final fileName = filePath.substring(index);
//    users/photo
    try {
      //para guardar en la ruta tal.
      final ref = _storage.ref("$colection/$fileName");
      await ref.putFile(file);
      //retorna el url.
      return await ref.getDownloadURL();
    } on FirebaseException catch (e) {
      return Future.error("Error cargando archivo foto de perfil: $e");
    }
    return "";
  }
}
