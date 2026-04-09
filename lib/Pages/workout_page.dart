import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Components/custom_action_button.dart';
import '../Components/back_button.dart';
import '../Components/text_field.dart';
import '../Services/firestore_service.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();
  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _resultController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final name = _nameController.text.trim();
    final resultText = _resultController.text.trim().replaceAll(',', '.');

    if (currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please login first')),
      );
      return;
    }

    if (name.isEmpty || resultText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter name and result')),
      );
      return;
    }

    setState(() => _isSaving = true);
    try {
      await _firestoreService.addWorkout(
        uid: currentUser.uid,
        name: name,
        weight: resultText,
      );
      if (!mounted) return;
      Navigator.pushNamed(context, '/home');
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to save workout')),
      );
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                          "Workout",
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
                      labelText: "Name",
                      controller: _nameController,
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      labelText: "Result",
                      controller: _resultController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                    ),
                  ],
                ),

                Flexible(fit: FlexFit.loose, child: Container()),

                Column(
                  children: [
                    _isSaving
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            text: "Save",
                            width: 600,
                            onTap: _handleSave,
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
