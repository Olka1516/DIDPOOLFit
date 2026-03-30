import 'package:flutter/material.dart';
import '../Components/custom_action_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: 'DIDPOOL',
                    style: TextStyle(color: Color(0xFF6B50F6)),
                  ),
                  TextSpan(
                    text: 'Fit',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "Everybody Can Train",
              style: TextStyle(color: Color(0xFFB6B4C2), fontSize: 18),
            ),

            const SizedBox(height: 46),

            CustomButton(
              text: "Get Started",
              width: 315,
              onTap: () {
                Navigator.pushNamed(context, '/onboarding');
              },
            ),
          ],
        ),
      ),
    );
  }
}
