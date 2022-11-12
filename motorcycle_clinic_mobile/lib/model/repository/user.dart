import '../entity/user.dart';

class UserRepository {
  //Map con su tipos
  final _users = <String, UserEntity>{};

  UserRepository() {
    _users["diego@gmail.com"] = UserEntity(
        email: "diego@gmail.com",
        name: "Diego Felipe",
        lastName: "Gallo Garcia",
        phoneNumber: "3108796935",
        password: "123456",
        isAdmin: true);
    _users["melissa@gmail.com"] = UserEntity(
        email: "melissa@gmail.com",
        name: "Marlys Melissa",
        lastName: "Cely Castillo",
        phoneNumber: "3228348408",
        password: "654321",
        isAdmin: false);
  }

  UserEntity findByEmail(String email) {
    var user = _users[email];

    if (user == null) {
      throw Exception("El usuario no existe.");
    }
    return user;
  }
}
