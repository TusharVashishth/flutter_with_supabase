import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promptia/routes/route_names.dart';
import 'package:promptia/util/style_constants.dart';

class NoPromptFound extends StatelessWidget {
  const NoPromptFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("No Prompt found ."),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () => Get.offAndToNamed(RouteNames.addPrompt),
          style: authButtonStyle(),
          child: const Text("Create new prompt"),
        )
      ],
    );
  }
}
