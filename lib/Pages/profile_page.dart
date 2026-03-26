import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Components/back_button.dart';
import '../Components/custom_action_button.dart';
import '../Components/custom_app_bar.dart';
import '../Components/info_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
              onHomeTap: () {},
              onPlusTap: () {},
              onProfileTap: () {},
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
                  BackButtonWidget(onTap: () {}),
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
                        child: SizedBox(
                          child: SvgPicture.asset(
                            'assets/images/icons/avatar.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "Olka Korolchuk",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    text: "Edit",
                    width: 160,
                    verticalPadding: 6,
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                children: const [
                  Expanded(
                    child: InfoCard(value: "180cm", label: "Height"),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InfoCard(value: "65kg", label: "Weight"),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: InfoCard(value: "22yo", label: "Age"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: isMobile
          ? CustomAppBar(
              currentIndex: 1,
              onHomeTap: () {},
              onPlusTap: () {},
              onProfileTap: () {},
            )
          : null,
    );
  }
}
