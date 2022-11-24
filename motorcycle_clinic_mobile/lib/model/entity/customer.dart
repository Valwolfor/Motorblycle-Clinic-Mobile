import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerEntity {
  late String? typeId; //creo que es diferente por combo
  late String? id;
  late String? name;
  late String? lastName;
  late String? email;
  late String? phoneNumber;

  CustomerEntity(
      {this.typeId,
      this.id,
      this.name,
      this.lastName,
      this.email,
      this.phoneNumber});

  //para obtener
  factory CustomerEntity.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    //devielve todos los datos en map consultados.
    var data = snapshot.data();
    return CustomerEntity(
      typeId: data?["typeId"],
      id: data?["id"],
      name: data?["name"],
      lastName: data?["lastName"],
      email: data?["email"],
      phoneNumber: data?["phoneNumber"],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (typeId != null && typeId!.isNotEmpty) "typeId": typeId,
      if (id != null && id!.isNotEmpty) "id": id,
      if (name != null && name!.isNotEmpty) "name": name,
      if (lastName != null && lastName!.isNotEmpty) "lastName": lastName,
      if (email != null && email!.isNotEmpty) "email": email,
      if (phoneNumber != null && phoneNumber!.isNotEmpty)
        "phoneNumber": phoneNumber
      //el primer ? es indicativo de null, el según el ?option.
    };
  }

  @override
  String toString() {
    return "CustomerEntity {$typeId, $id, $name, $lastName, $email, $phoneNumber}";
  }
}
