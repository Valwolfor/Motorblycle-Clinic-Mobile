import 'package:motorcycle_clinic_mobile/model/entity/user.dart';

import '/model/repository/fb_auth.dart';
import 'request/register_request.dart';

class RegisterController {
  late final FirebaseAuthenticationRepository _fbAuthRepository;

  RegisterController() {
    _fbAuthRepository = FirebaseAuthenticationRepository();
  }

  Future<void> registerNewUser(RegisterRequest request,
      {bool adminUser = false}) async {
    //Crear usuario en firebase.

    await _fbAuthRepository.createUserWithEmailAndPassword(
        request.email, request.password);

    //Agregar información adicional en BD
    _fbAuthRepository.saveData(UserEntity(
        email: request.email,
        name: request.name,
        lastName: request.lastName,
        phoneNumber: request.phoneNumber,
        isAdmin: adminUser));
  }
}
