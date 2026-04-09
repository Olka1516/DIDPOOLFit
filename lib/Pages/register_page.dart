import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Components/text_field.dart';
import '../Components/custom_action_button.dart';
import '../Services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final AuthService _authService = AuthService();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final phone = _phoneController.text;
    final fullName = _nameController.text;
    if (email.isEmpty || password.isEmpty || phone.isEmpty || fullName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter all fields')),
      );
      return;
    }
    setState(() => _isLoading = true);
    try {
      await _authService.signUpWithEmail(
        fullName: fullName,
        email: email,
        phone: phone,
        password: password,
      );
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Registration failed')),
      );
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Unexpected error. Try again.')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
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
                  ],
                ),

                CustomTextField(
                  labelText: "Full Name",
                  prefixIconPath: "assets/images/icons/profile.svg",
                  controller: _nameController,
                ),
                const SizedBox(height: 14),
                CustomTextField(
                  labelText: "Phone Number",
                  prefixIconPath: "assets/images/icons/phone.svg",
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 14),
                CustomTextField(
                  labelText: "Email",
                  prefixIconPath: "assets/images/icons/email.svg",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 14),
                CustomTextField(
                  labelText: "Password",
                  isObscure: true,
                  prefixIconPath: "assets/images/icons/lock.svg",
                  controller: _passwordController,
                ),

                Flexible(fit: FlexFit.loose, child: Container()),

                Column(
                  children: [
                    _isLoading
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            text: "Register",
                            width: 600,
                            onTap: _handleRegister,
                          ),

                    const SizedBox(height: 22),

                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
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

