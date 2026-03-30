import 'package:flutter/material.dart';

import 'Pages/loading_screen.dart';
import 'Pages/welcome_page.dart';
import 'Pages/onboarding_page.dart';
import 'Pages/register_page.dart';
import 'Pages/login_page.dart';
import 'Pages/home_page.dart';
import 'Pages/workout_page.dart';
import 'Pages/profile_page.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/welcome': (context) => WelcomePage(),
        '/onboarding': (context) => OnboardingPage(),
        '/register': (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/workoutPage': (context) => WorkoutPage(),
        '/profile': (context) => ProfilePage(),
        '/editPage': (context) => EditPage(),
      },
    );
  }
}
