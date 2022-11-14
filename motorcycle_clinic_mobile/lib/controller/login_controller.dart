import 'package:motorcycle_clinic_mobile/model/repository/fb_auth.dart';

import '/model/repository/user.dart';
import 'request/login_request.dart';

class LoginController {
  late final FirebaseAuthenticationRepository userRepository;

  LoginController() {
    userRepository = FirebaseAuthenticationRepository();
  }
  Future<String> validateLogin(LoginRequest request) async {
    await userRepository.singInWithEmailAndPassword(
        request.email, request.password);
    var user = "userRepository";
    // var nameUser = "${user.name} ${user.lastName}";
    return user;
  }
}
