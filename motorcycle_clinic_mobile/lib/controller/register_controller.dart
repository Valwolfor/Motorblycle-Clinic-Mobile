import '/model/repository/fb_storage.dart';
import '/model/entity/user.dart';
import '/model/repository/user.dart';
import '/model/repository/fb_auth.dart';
import 'request/photo_user_request.dart';
import 'request/register_request.dart';

class RegisterController {
  late final FirebaseAuthenticationRepository _fbAuthRepository;
  late final UserRepository _userRepository;
  late final FirebaseStorageRepository _storageRepository;
  RegisterController() {
    _fbAuthRepository = FirebaseAuthenticationRepository();
    _userRepository = UserRepository();
    _storageRepository = FirebaseStorageRepository();
  }

  Future<void> registerNewUser(RegisterRequest request,
      {bool adminUser = false}) async {
    //Crear usuario en firebase.
    try {
      await _userRepository.findByEmail(request.email);
      return Future.error("Ya existe un usuario con el correo ingresado");
    } catch (e) {
      //Como usuario no existe, se crea uno.
      await _fbAuthRepository.createUserWithEmailAndPassword(
          request.email, request.password);

      //Agregar información adicional en BD

      _userRepository.save(UserEntity(
          email: request.email,
          name: request.name,
          lastName: request.lastName,
          phoneNumber: request.phoneNumber,
          isAdmin: adminUser));
    }
  }

  Future<void> registerPhoto(PhotoRequest request, String uid) async {
    //Crear usuario en firebase.

    try {
      //recibe info de storage
      var urlPhoto =
          await _storageRepository.loadFile(request.photo!, "users/photo");
      //Agregar información adicional en BD
      await _userRepository.savePhoto(uid, urlPhoto);
    } catch (e) {
      return Future.error(
          "Error en el registro de la foto en la base de datos $e");
    }
  }
}
