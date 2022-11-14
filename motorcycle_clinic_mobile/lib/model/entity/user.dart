class UserEntity {
  //LATE para manejar el null, el ?option para que pueda tener null
  late String? name;
  late String? lastName;
  late String? email;
  // late String? password;
  late String? phoneNumber;
  late bool? isAdmin;

  UserEntity(
      {this.name,
      this.lastName,
      this.email,
      // this.password, no se necesita porque es validada por FB
      this.phoneNumber,
      this.isAdmin});

  @override
  String toString() {
    return "UserEntity {$name, $lastName, $email, $phoneNumber, $isAdmin}";
  }
}
