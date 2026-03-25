import 'package:flutter/material.dart';

//import 'package:flutter_application_1/Pages/profile_page.dart';
// import 'Pages/welcome_page.dart';
// import 'Pages/onboarding_page.dart';
// import 'Pages/register_page.dart';
// import 'Pages/login_page.dart';
// import 'Pages/workout_page.dart';
import 'Pages/edit_user_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DIDPOOLFit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
      // home: const WelcomePage(),
      // home: const OnboardingPage(),
      // home: const RegisterPage(),
      // home: const LoginPage(),
      // home: const WorkoutPage(),
      home: const EditPage(),
    );
  }
}
