class UserEntity {
  //LATE para manejar el null, el ?option para que pueda tener null
  late String? name;
  late String? lastName;
  late String? email;
  late String? password;
  late String? phoneNumber;
  late bool? isAdmin;

  UserEntity(
      {this.name,
      this.lastName,
      this.email,
      this.password,
      this.phoneNumber,
      this.isAdmin});
}
