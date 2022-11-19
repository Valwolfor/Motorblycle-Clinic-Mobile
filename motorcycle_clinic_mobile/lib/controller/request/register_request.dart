class RegisterRequest {
  //se usa el late cuando se está seguro que se llenarán todos los campos
  late String name;
  late String lastName;
  late String phoneNumber;
  late String email;
  late String password;

  @override
  String toString() {
    return "$name, $lastName, $phoneNumber, $email, $password";
  }
}
