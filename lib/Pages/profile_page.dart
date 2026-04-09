import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Components/back_button.dart';
import '../Components/custom_action_button.dart';
import '../Components/custom_app_bar.dart';
import '../Components/info_card.dart';
import '../Services/auth_service.dart';
import '../Services/firestore_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final PageController _pageController = PageController();
  final _authService = AuthService();
  final _firestoreService = FirestoreService();

  User? get user => FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _handleLogout() async {
    try {
      await _authService.signOut();
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Failed to sign out')));
    }
  }

  Widget _userName() {
    if (user == null) return const Text("User");
    return StreamBuilder<String?>(
      stream: _firestoreService.getUserFullName(user!.uid),
      builder: (context, snapshot) {
        final fullName = snapshot.data;
        final authName = user?.displayName?.trim();
        return Text(
          fullName ?? 'User',
          style: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        );
      },
    );
  }

  Widget _userMetric(String field, String unit, String label) {
    if (user == null) return InfoCard(value: '--', label: label);
    return StreamBuilder<String?>(
      stream: _firestoreService.getUserMetric(user!.uid, field: field, unit: unit),
      builder: (context, snapshot) {
        return InfoCard(value: snapshot.data ?? '--', label: label);
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
              currentIndex: 1,
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 82),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackButtonWidget(
                    onTap: () => Navigator.pushNamed(context, '/home'),
                  ),
                  const Spacer(),
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: const Color(0xFF6B50F6),
                    child: IconButton(
                      icon: SvgPicture.asset("assets/images/icons/logout.svg"),
                      onPressed: _handleLogout,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0x4DEEA4CE), Color(0x4DC150F6)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipOval(
                        child: SvgPicture.asset(
                          'assets/images/icons/avatar.svg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(child: _userName()),
                  const Spacer(),
                  CustomButton(
                    text: "Edit",
                    width: 100,
                    verticalPadding: 6,
                    onTap: () => Navigator.pushNamed(context, '/editPage'),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(child: _userMetric('height', 'cm', 'Height')),
                  const SizedBox(width: 10),
                  Expanded(child: _userMetric('weight', 'kg', 'Weight')),
                  const SizedBox(width: 10),
                  Expanded(child: _userMetric('age', 'yo', 'Age')),
                ],
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: isMobile
          ? CustomAppBar(
              currentIndex: 1,
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