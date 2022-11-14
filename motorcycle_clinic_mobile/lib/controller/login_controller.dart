import '/model/repository/user.dart';
import 'request/login_request.dart';

class LoginController {
  late final UserRepository userRepository;

  LoginController() {
    userRepository = UserRepository();
  }
  String validateLogin(LoginRequest request) {
    var user = userRepository.findByEmail(request.email);

    // if (user.password != request.password) {
    //   throw Exception("Los datos ingresados son incorrectos");
    // }
    var nameUser = "${user.name} ${user.lastName}";
    return nameUser;
  }
}
