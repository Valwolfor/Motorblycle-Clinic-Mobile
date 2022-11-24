class CustomerRequest {
  //se usa el late cuando se está seguro que se llenarán todos los campos
  late String typeId;
  late String id;
  late String name;
  late String lastName;
  late String email;
  late String phoneNumber;

  @override
  String toString() {
    return "$typeId, $id, $name, $lastName, $phoneNumber, $email";
  }
}
