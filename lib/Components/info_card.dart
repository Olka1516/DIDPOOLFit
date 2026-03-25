import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String value;
  final String label;
  final double? width;

  const InfoCard({
    super.key,
    required this.value,
    required this.label,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF1D1617).withOpacity(0.07),
            blurRadius: 40,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFFC150F6),
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              fontFamily: "Poppins",
              color: Color(0xFFB6B4C2),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
