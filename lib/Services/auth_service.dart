import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
  }

  Future<UserCredential> signUpWithEmail({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );

    final uid = credential.user?.uid;
    if (uid != null) {
      await _firestore.collection('users').doc(uid).set({
        'fullName': fullName.trim(),
        'email': email.trim(),
        'phone': phone.trim(),
        'height': 0,
        'weight': 0,
        'age': 0,
      });
    }

    return credential;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
