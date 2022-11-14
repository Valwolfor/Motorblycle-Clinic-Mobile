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

  Map<String, dynamic> toFirestore() {
    return {
      if (email != null && email!.isNotEmpty) "email": email,
      if (name != null && name!.isNotEmpty) "name": name,
      if (lastName != null && lastName!.isNotEmpty) "lastName": lastName,
      if (phoneNumber != null && phoneNumber!.isNotEmpty)
        "phoneNumber": phoneNumber,
      "isAdmin": isAdmin ?? false
      //el primer ? es indicativo de null, el según el ?option.
    };
  }

  @override
  String toString() {
    return "UserEntity {$name, $lastName, $email, $phoneNumber, $isAdmin}";
  }
}
