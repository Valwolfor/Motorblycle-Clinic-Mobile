import 'package:motorcycle_clinic_mobile/model/repository/fb_auth.dart';

import '/model/repository/user.dart';
import 'request/login_request.dart';

class LoginController {
  late final FirebaseAuthenticationRepository userAuthRepository;
  late final UserRepository userRepository;
  LoginController() {
    userAuthRepository = FirebaseAuthenticationRepository();
    userRepository = UserRepository();
  }
  Future<String> validateLogin(LoginRequest request) async {
    await userAuthRepository.singInWithEmailAndPassword(
        request.email, request.password);
    var user = await userRepository.findByEmail(request.email);

    var nameUser = "${user.name} ${user.lastName}";
    return nameUser;
  }
}
