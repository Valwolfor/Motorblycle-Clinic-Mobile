class LoginRequest {
  //se usa el late cuando se está seguro que se llenarán todos los campos
  late String email;
  late String password;

  //cosntructor que puede recibibir null.
  // LoginRequest({this.email, this.password});
}
