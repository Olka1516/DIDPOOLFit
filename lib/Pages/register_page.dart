import 'package:flutter/material.dart';

import '../Components/text_field.dart';
import '../Components/custom_action_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Container(
            width: 600,
            height: 700,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      "Hey there,",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Create an Account",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: 29),

                    CustomTextField(
                      labelText: "Full Name",
                      prefixIconPath: "assets/images/icons/profile.svg",
                    ),
                    SizedBox(height: 14),
                    CustomTextField(
                      labelText: "Phone Number",
                      prefixIconPath: "assets/images/icons/phone.svg",
                    ),
                    SizedBox(height: 14),
                    CustomTextField(
                      labelText: "Email",
                      prefixIconPath: "assets/images/icons/email.svg",
                    ),
                    SizedBox(height: 14),
                    CustomTextField(
                      labelText: "Password",
                      isObscure: true,
                      prefixIconPath: "assets/images/icons/lock.svg",
                    ),
                  ],
                ),

                Flexible(fit: FlexFit.loose, child: Container()),

                Column(
                  children: [
                    CustomButton(text: "Register", width: 600, onTap: () {}),

                    const SizedBox(height: 22),

                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          Colors.transparent,
                        ),
                      ),
                      child: RichText(
                        text: const TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Color(0xFFC150F6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
