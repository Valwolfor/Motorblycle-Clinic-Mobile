import 'package:motorcycle_clinic_mobile/model/repository/fb_auth.dart';

import '/model/repository/user.dart';
import 'request/login_request.dart';
import 'response/user_info_response.dart';

class LoginController {
  late final FirebaseAuthenticationRepository _userAuthRepository;
  late final UserRepository _userRepository;
  LoginController() {
    _userAuthRepository = FirebaseAuthenticationRepository();
    _userRepository = UserRepository();
  }
  Future<UserInfoResponse> validateLogin(LoginRequest request) async {
    await _userAuthRepository.singInWithEmailAndPassword(
        request.email, request.password);
    var user = await _userRepository.findByEmail(request.email);

    //podría ir un if
    return UserInfoResponse(
        id: user.id,
        name: user.name,
        lastName: user.lastName,
        photo: user.photo,
        email: user.email,
        isAdmin: user.isAdmin);
  }

  Future<void> logout() async {
    await _userAuthRepository.signOut();
  }
}
