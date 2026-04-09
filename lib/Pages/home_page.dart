import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Components/custom_app_bar.dart';
import '../Components/custom_list.dart';
import '../Components/text_field.dart';
import '../Components/empty_state.dart';
import '../Services/firestore_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firestoreService = FirestoreService();
  String _searchQuery = '';

  User? get user => FirebaseAuth.instance.currentUser;

  Widget _buildWorkoutList(String uid) {
    return StreamBuilder<List<Map<String, String>>>(
      stream: _firestoreService.getWorkouts(uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text('Failed to load workouts'),
          );
        }

        final exercises = snapshot.data ?? [];
        final filteredExercises = exercises.where((exercise) {
          final name = (exercise['name'] ?? '').toLowerCase();
          return name.contains(_searchQuery.toLowerCase());
        }).toList();

        if (filteredExercises.isEmpty) {
          return const EmptyState();
        }

        return CustomList(exercises: filteredExercises);
      },
    );
  }

  Widget _buildUserName() {
    return StreamBuilder<String?>(
      stream: _firestoreService.getUserFullName(user!.uid),
      builder: (context, snapshot) {
        final fullName = snapshot.data;
        return Text(
          fullName ?? 'User',
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isMobile
          ? null
          : CustomAppBar(
              currentIndex: 0,
              onHomeTap: () {
                Navigator.pushNamed(context, '/home');
              },
              onPlusTap: () {
                Navigator.pushNamed(context, '/workoutPage');
              },
              onProfileTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
      body: Center(
        child: Container(
          width: 600,
          height: 700,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome Back,',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFA5A3B0),
                ),
              ),

              const SizedBox(height: 5),

              _buildUserName(),

              const SizedBox(height: 30),

              CustomTextField(
                labelText: "Search",
                onChanged: (value) {
                  setState(() => _searchQuery = value.trim());
                },
              ),

              const SizedBox(height: 24),

              Expanded(
                child: user == null
                    ? const EmptyState()
                    : _buildWorkoutList(user!.uid),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: isMobile
          ? CustomAppBar(
              currentIndex: 0,
              onHomeTap: () {
                Navigator.pushNamed(context, '/home');
              },
              onPlusTap: () {
                Navigator.pushNamed(context, '/workoutPage');
              },
              onProfileTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              isBottom: true,
            )
          : null,
    );
  }
}
