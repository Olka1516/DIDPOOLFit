import 'package:flutter/material.dart';

import '../Components/custom_action_button.dart';
import '../Components/back_button.dart';
import '../Components/text_field.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BackButtonWidget(
                          onTap: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),

                        const Spacer(),

                        const Text(
                          "Workout",
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

                    const SizedBox(height: 51),

                    CustomTextField(labelText: "Name"),
                    const SizedBox(height: 14),
                    CustomTextField(labelText: "Result"),
                  ],
                ),

                Flexible(fit: FlexFit.loose, child: Container()),

                Column(
                  children: [
                    CustomButton(
                      text: "Save",
                      width: 600,
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      },
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
