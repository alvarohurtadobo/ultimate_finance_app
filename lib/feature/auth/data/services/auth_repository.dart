import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Unknown error';
    } catch (error) {
      throw 'Generic error: $error';
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Stream<User?> get authState => _firebaseAuth.userChanges();

  /// Sign in with Google using a provided OAuth credential
  /// In production, this credential should come from google_sign_in package
  Future<User?> signInWithGoogle({required AuthCredential credential}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Unknown error';
    } catch (error) {
      throw 'Generic error: $error';
    }
  }

  /// Sign in with Apple using a provided OAuth credential
  /// In production, this credential should come from sign_in_with_apple package
  Future<User?> signInWithApple({required AuthCredential credential}) async {
    try {
      final userCredential = await _firebaseAuth.signInWithCredential(credential);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Unknown error';
    } catch (error) {
      throw 'Generic error: $error';
    }
  }
}
