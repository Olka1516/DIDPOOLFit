import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Components/custom_action_button.dart';
import '../Components/back_button.dart';
import '../Components/text_field.dart';
import '../Services/firestore_service.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _firestoreService = FirestoreService();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _ageController = TextEditingController();

  bool _isLoading = true;
  bool _isSaving = false;

  User? get _user => FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future<void> _loadUserProfile() async {
    final currentUser = _user;
    if (currentUser == null) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      return;
    }

    try {
      final data = await _firestoreService.getUserProfile(currentUser.uid);
      if (!mounted) return;

      _heightController.text = _normalizeInitialValue(data?['height']);
      _weightController.text = _normalizeInitialValue(data?['weight']);
      _ageController.text = _normalizeInitialValue(data?['age']);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load user data')),
      );
    } finally {
      if (!mounted) return;
      setState(() => _isLoading = false);
    }
  }

  String _normalizeInitialValue(dynamic value) {
    if (value == null) return '';
    final text = value.toString().trim();
    if (text.isEmpty || text == '0') return '';
    return text;
  }

  Future<void> _saveUserProfile() async {
    final currentUser = _user;
    if (currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User is not authorized')),
      );
      return;
    }

    final height = int.tryParse(_heightController.text.trim());
    final weight = int.tryParse(_weightController.text.trim());
    final age = int.tryParse(_ageController.text.trim());

    if (height == null || weight == null || age == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter valid numeric values')),
      );
      return;
    }

    setState(() => _isSaving = true);
    try {
      await _firestoreService.updateUserProfile(
        uid: currentUser.uid,
        height: height,
        weight: weight,
        age: age,
      );

      if (!mounted) return;
      Navigator.pushNamed(context, '/profile');
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to save user data')),
      );
    } finally {
      if (!mounted) return;
      setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Container(
            width: 600,
            height: 700,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BackButtonWidget(
                          onTap: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),

                        const Spacer(),

                        const Text(
                          "Edit",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),

                        const Spacer(),
                      ],
                    ),

                    const SizedBox(height: 51),

                    CustomTextField(
                      labelText: "Height",
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      labelText: "Weight",
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      labelText: "Age",
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),

                Flexible(fit: FlexFit.loose, child: Container()),

                Column(
                  children: [
                    CustomButton(
                      text: "Save",
                      width: 600,
                      onTap: _isSaving ? () {} : _saveUserProfile,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
