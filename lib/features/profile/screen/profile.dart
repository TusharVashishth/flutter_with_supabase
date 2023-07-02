import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promptia/common/widgets/loader.dart';
import 'package:promptia/common/widgets/prompt_card.dart';
import 'package:promptia/features/profile/controller/profile_controller.dart';
import 'package:promptia/common/widgets/no_prompt_found.dart';
import 'package:promptia/services/auth_service.dart';
import 'package:promptia/services/supabase_service.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService =
        Get.put(AuthService(SupabaseService.supabase));
    final ProfileController profileController = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: false,
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  authService.userName(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                profileController.logOut();
              },
              child: const Text("SignOut"),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() => profileController.isLoading.value
                ? const Loader()
                : Column(
                    children: [
                      ...[
                        if (profileController.prompts.isNotEmpty &&
                            !profileController.notFound.value)
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: profileController.prompts.length,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => InkWell(
                                    onLongPress: () {
                                      profileController.deletePrompt(
                                          profileController.prompts[index]);
                                    },
                                    child: PromptCard(
                                      promptModel:
                                          profileController.prompts[index],
                                    ),
                                  ))
                        else
                          const NoPromptFound()
                      ]
                    ],
                  ))
          ],
        ),
      ),
    );
  }
}
