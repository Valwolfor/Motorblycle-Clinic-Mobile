import 'package:firebase_auth/firebase_auth.dart';
import 'package:motorcycle_clinic_mobile/model/entity/user.dart';

class FirebaseAuthenticationRepository {
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //future error termina el programa y bota

        return Future.error(
          'La contraseña es muy debil.',
        );
      } else if (e.code == 'email-already-in-use') {
        return Future.error(
          'Ya existe una cuenta para este correo.',
        );
      }
    } catch (e) {
      return Future.error(
        "En registro de autenticación: $e",
      );
    }
  }

  void saveData(UserEntity user) {
    print(user);
  }

  Future<void> singInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('No existe usuarios registrados con ese correo');
      } else if (e.code == 'wrong-password') {
        return Future.error('Los datos ingresados son incorrectos');
      }
    }
  }
}
