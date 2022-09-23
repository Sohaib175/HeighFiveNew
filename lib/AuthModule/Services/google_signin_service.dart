import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInServices {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    User? user;
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          // TODO: Account Exist
        } else if (e.code == 'invalid-credential') {
          // TODO: Invalid Credentials

        }
      } catch (e) {
        // TODO: Other Exceptions
      }
      return user;
    }
  }

  signOut() async {
    try {
      // await FirebaseAuth.instance.signOut();
      await googleSignIn.signOut();
      await googleSignIn.disconnect();
    } catch (e) {
      // TODO: Error Signing out
    }
  }
}
