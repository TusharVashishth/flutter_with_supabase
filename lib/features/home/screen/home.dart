import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promptia/common/widgets/loader.dart';
import 'package:promptia/common/widgets/no_prompt_found.dart';
import 'package:promptia/common/widgets/prompt_card.dart';
import 'package:promptia/features/home/controller/home_controller.dart';
import 'package:promptia/features/home/widgets/home_hero.dart';
import 'package:promptia/routes/route_names.dart';
import 'package:promptia/util/constants_widget.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHero(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Latest Prompts",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Obx(() => homeController.isLoading.value
                  ? const Center(child: Loader())
                  : Column(
                      children: [
                        ...[
                          if (homeController.prompts.isNotEmpty &&
                              !homeController.notFound.value)
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: homeController.prompts.length,
                                itemBuilder: (context, index) => PromptCard(
                                      promptModel:
                                          homeController.prompts[index],
                                    ))
                          else
                            const NoPromptFound()
                        ]
                      ],
                    ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(RouteNames.addPrompt),
        label: const Icon(Icons.add),
      ),
    );
  }
}
