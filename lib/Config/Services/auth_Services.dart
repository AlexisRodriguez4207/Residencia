import 'package:firebase_auth/firebase_auth.dart';
import 'package:residencia_v2/Config/Preferences/shared_preferences.dart';
import 'package:residencia_v2/Config/Services/database_services.dart';

class AuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  var prefs = UserPreferences();

  createAccount(
    String name,
    String lastname,
    String age,
    String email,
    String password,
  ) async {
    try {
      // create account
      //Await para esperar la respuesta de la creacion de la cuenta
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // ? = puede que sea null
      if (userCredential.user?.uid != null) {
        int e = int.parse(age);
        prefs.uid = userCredential.user!.uid;

        bool response =
            await DatabaseServices().addUser(name, lastname, e, email);
        return 3;
      }
    } on FirebaseAuthException catch (e) {
      // Error de autenticacion
      if (e.code == 'weak-password') {
        return 1;
        // return 'La contraseña es muy debil';
      } else if (e.code == 'email-already-in-use') {
        return 2;
        // return 'El correo ya esta en uso';
      }
    }
  }

  signAccount(
    String email,
    String password,
  ) async {
    try {
      // create account
      //Await para esperar la respuesta de la creacion de la cuenta
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      // ? = puede que sea null
      if (userCredential.user?.uid != null) {
        prefs.uid = userCredential.user!.uid;

        return 3;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return 1;
    }
  }
}
