import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Add your results',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          color: Color(0xFFA5A3B0),
        ),
      ),
    );
  }
}