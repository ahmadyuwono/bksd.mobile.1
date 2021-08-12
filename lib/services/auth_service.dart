import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User?> signInAnonymous() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      throw e;
    }
  }

  static Future<User?> signUp(String email, String password) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? firebaseUser = result.user;

    try {
      await firebaseUser!.sendEmailVerification();
      return firebaseUser;
    } catch (e) {
      throw e;
    }
  }

  static Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? firebaseUser = result.user;

      return firebaseUser;
    } catch (e) {
      throw e;
    }
  }

  static Future<void> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw e;
    }
  }

  static Future<void> deleteAccount() async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        await user.delete();
      } catch (e) {
        throw e;
      }
    }
  }

  static Future<void> updatePassword(String newPassword) async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        await user.updatePassword(newPassword);
      } catch (e) {
        throw e;
      }
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Stream<User?> get firebaseUserStream => _auth.authStateChanges();
}
