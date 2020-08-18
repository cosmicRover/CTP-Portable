import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  ///Sign in user and return the user
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );
  Future<bool> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  ///getters for functions
  Future<bool> get signInUser async => await _handleSignIn();
}
