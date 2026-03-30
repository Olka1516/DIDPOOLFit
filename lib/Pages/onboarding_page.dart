import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);

    if (isMobile) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x4dC150F6), Color(0x4dEEA4CE)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      height: 330,
                      child: Image.asset(
                        'assets/images/trainer.png',
                        width: 220,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  SizedBox(height: 64),

                  Text(
                    'Track Your Goal',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "Don't worry if you have trouble determining your goals, "
                    "we can help you determine your goals and track your goals",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF818089),
                    ),
                  ),

                  Spacer(),

                  Align(
                    alignment: Alignment.centerRight,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Color(0xFF6B50F6),
                      child: IconButton(
                        icon: SvgPicture.asset("assets/images/icons/arrow.svg"),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x4dC150F6), Color(0x4dEEA4CE)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 104, bottom: 0),
                  child: Image.asset(
                    'assets/images/trainer.png',
                    width: 420,
                    height: 670,
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 104, bottom: 40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Track Your Goal',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 15),

                      SizedBox(
                        width: 340,
                        child: Text(
                          "Don't worry if you have trouble determining your goals, "
                          "we can help you determine your goals and track your goals",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFB6B4C2),
                          ),
                        ),
                      ),

                      SizedBox(height: 128),

                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Color(0xFF6B50F6),
                        child: IconButton(
                          icon: SvgPicture.asset(
                            "assets/images/icons/arrow.svg",
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
