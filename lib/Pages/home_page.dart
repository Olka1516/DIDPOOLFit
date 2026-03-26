import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Components/custom_app_bar.dart';
import '../Components/custom_list.dart';
import '../Components/text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);

    final exercises = [
      {'name': 'Bench Press', 'weight': '45 kg'},
      {'name': 'Squat', 'weight': '60 kg'},
      {'name': 'Deadlift', 'weight': '70 kg'},
      {'name': 'Shoulder Press', 'weight': '25 kg'},
      {'name': 'Bicep Curl', 'weight': '12 kg'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isMobile
          ? null
          : CustomAppBar(
              currentIndex: 0,
              onHomeTap: () {},
              onPlusTap: () {},
              onProfileTap: () {},
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

              const Text(
                'Olka Korolchuk',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 30),

              CustomTextField(labelText: "Search", isObscure: true),

              const SizedBox(height: 24),

              Expanded(child: CustomList(exercises: exercises)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: isMobile
          ? CustomAppBar(
              currentIndex: 0,
              onHomeTap: () {},
              onPlusTap: () {},
              onProfileTap: () {},
            )
          : null,
    );
  }
}
