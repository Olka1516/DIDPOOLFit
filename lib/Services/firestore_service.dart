import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  Stream<String?> getUserFullName(String uid) {
    return _db.collection('users').doc(uid).snapshots().map((doc) {
      final data = doc.data();
      final fullName = data?['fullName']?.toString().trim();

      if (fullName != null && fullName.isNotEmpty) return fullName;

      return 'User';
    });
  }

  Stream<List<Map<String, String>>> getWorkouts(String uid) {
    return _db
        .collection('users')
        .doc(uid)
        .collection('workouts')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return {
          'name': '${data['name'] ?? ''}',
          'weight': '${data['weight'] ?? ''}',
        };
      }).toList();
    });
  }

  Stream<String?> getUserMetric(
    String uid, {
    required String field,
    required String unit,
  }) {
    return _db.collection('users').doc(uid).snapshots().map((doc) {
      final data = doc.data();
      final value = data?[field];
      if (value == null) return null;

      final text = value.toString().trim();
      if (text.isEmpty) return null;

      return '$text$unit';
    });
  }

  Future<Map<String, dynamic>?> getUserProfile(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();
    return doc.data();
  }

  Future<void> updateUserProfile({
    required String uid,
    required int height,
    required int weight,
    required int age,
  }) async {
    await _db.collection('users').doc(uid).set({
      'height': height,
      'weight': weight,
      'age': age,
    }, SetOptions(merge: true));
  }

  Future<void> addWorkout({
    required String uid,
    required String name,
    required String weight,
  }) async {
    await _db.collection('users').doc(uid).collection('workouts').add({
      'name': name.trim(),
      'weight': weight.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}