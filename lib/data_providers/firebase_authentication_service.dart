import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get user => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      print("Erro ao tentar deslogar: $e");
      // Trate o erro adequadamente, talvez mostrando um Snackbar com o erro para o usuário.
    }

  }
  
  Future<User?> createUserWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;
    return user;
  }

  Future<void> updateEmail(String newEmail) async {
    User? user = _firebaseAuth.currentUser;

    if (user != null) {
      try {
        await user.verifyBeforeUpdateEmail(newEmail);
        print("Por favor, verifique seu novo email para confirmar a mudança.");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'requires-recent-login') {
          // Força a reautenticação
          print('O usuário precisa ter feito login recentemente para atualizar seu email.');
          // Tenta novamente após reautenticação bem-sucedida
          await user.verifyBeforeUpdateEmail(newEmail);
          print("Por favor, verifique seu novo email para confirmar a mudança.");
        } else {
          print('Ocorreu um erro ao tentar atualizar o email: ${e.message}');
        }
      } catch (e) {
        print('Erro ao atualizar o email: $e');
      }
    } else {
      print("Nenhum usuário autenticado encontrado.");
    }
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }
}