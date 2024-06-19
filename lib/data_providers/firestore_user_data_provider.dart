import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreUserDataProvider {
  final FirebaseFirestore _firestoreUserService = FirebaseFirestore.instance;

  Future<void> insertUser(User user, Map<String, dynamic> userDetails) async {
    await _firestoreUserService.collection('users').add(userDetails).then((value) => print("Added user"));
  }

  Future<User?> getUserByEmail(String email) async {
    try {
      QuerySnapshot querySnapshot = await _firestoreUserService.collection('users').get();

    } catch (e) {
      // Trata qualquer exceção que possa ocorrer durante a consulta
      print('Error retrieving user by email: $e');
      return null;
    }
  }
}