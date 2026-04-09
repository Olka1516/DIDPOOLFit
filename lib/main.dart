import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Pages/loading_screen.dart';
import 'Pages/welcome_page.dart';
import 'Pages/onboarding_page.dart';
import 'Pages/register_page.dart';
import 'Pages/login_page.dart';
import 'Pages/home_page.dart';
import 'Pages/workout_page.dart';
import 'Pages/profile_page.dart';
import 'Pages/edit_user_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget _protectedRoute(Widget page) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return WelcomePage();
    return page;
  }

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
        '/home': (context) => _protectedRoute(HomePage()),
        '/workoutPage': (context) => _protectedRoute(WorkoutPage()),
        '/profile': (context) => _protectedRoute(ProfilePage()),
        '/editPage': (context) => _protectedRoute(EditPage()),
      },
    );
  }
}
