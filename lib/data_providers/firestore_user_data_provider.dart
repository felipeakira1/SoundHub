import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreUserDataProvider {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> insertUser(User user, Map<String, dynamic> userDetails) async {
    await _firestore.collection('users').doc(user.uid).set(userDetails);
  }

  Future<Map<String, dynamic>?> getUserByUid(String uid) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(uid).get();
      return userDoc.data() as Map<String, dynamic>?;
    } catch(e) {
      throw Exception("Failed to get user by uid: $e");
    }
  }

  Future<void> updateUser(String uid, Map<String, dynamic> updateDetails) async {
    try {
      await _firestore.collection('users').doc(uid).update(updateDetails);
    } catch(e) {
      throw Exception("Failed to update uesr: $e");
    }
  }
}