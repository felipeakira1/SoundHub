import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get user => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }
}