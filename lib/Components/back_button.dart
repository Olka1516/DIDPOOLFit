import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const BackButtonWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 40,
        height: 32,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color(0xFFF7F8F8),
          borderRadius: BorderRadius.circular(12),
        ),
        child: SvgPicture.asset(
          "assets/images/icons/arrowBlack.svg",
          width: 20,
          height: 16,
        ),
      ),
    );
  }
}
