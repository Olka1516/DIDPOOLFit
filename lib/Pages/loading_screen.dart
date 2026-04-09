import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _listenAuthAndNavigate();
  }

  void _listenAuthAndNavigate() {
    Future.delayed(Duration.zero, () {
      final auth = FirebaseAuth.instance;
      auth.authStateChanges().listen((user) {
        if (!mounted) return;
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WelcomePage()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.black,
          size: 200,
        ),
      ),
    );
  }
}
