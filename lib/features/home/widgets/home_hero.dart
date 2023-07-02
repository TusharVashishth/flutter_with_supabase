import 'package:flutter/material.dart';
import 'package:promptia/util/constants.dart';

class HomeHero extends StatelessWidget {
  const HomeHero({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          appName,
          style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          brandSubText,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
