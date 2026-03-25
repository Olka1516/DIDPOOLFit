import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomList extends StatelessWidget {
  final List<Map<String, String>> exercises;

  const CustomList({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: exercises.length,
      separatorBuilder: (_, __) =>
          const Divider(color: Color(0xFFC6C4D4), height: 1),
      itemBuilder: (context, index) {
        final exercise = exercises[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                child: SvgPicture.asset('assets/images/icons/weight.svg'),
              ),

              const SizedBox(width: 10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exercise['name']!,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    exercise['weight']!,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFB6B4C2),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
