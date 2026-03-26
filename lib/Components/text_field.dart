import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool isObscure;
  final IconData? prefixIcon;
  final String? prefixIconPath;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.isObscure = false,
    this.prefixIcon,
    this.prefixIconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscure,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF7F8F8),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18.0,
          horizontal: 16.0,
        ),
        prefixIcon: prefixIconPath != null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(prefixIconPath!, width: 20, height: 20),
              )
            : (prefixIcon != null
                  ? Icon(prefixIcon, color: const Color(0xFFB6B4C2))
                  : null),
        hintText: labelText,
        hintStyle: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          color: const Color(0xFFADA4A5).withOpacity(0.7),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
