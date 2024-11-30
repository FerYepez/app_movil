import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Inicio de seción con google
  sigInWithGoogle() async {
    // Comienza el inicio de sesion interactivo
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // Optiene los detalles
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // Crea una credencial para el usuario
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Finalmente, iniciamos sesion.
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
