import '/model/repository/user.dart';
import 'request/login_request.dart';

class LoginController {
  late final UserRepository userRepository;

  LoginController() {
    userRepository = UserRepository();
  }
  void validateLogin(LoginRequest request) {
    var user = userRepository.findByEmail(request.email);

    if (user.password != request.password) {
      throw Exception("Los datos ingresados son incorrectos");
    }
  }
}
