import 'dart:developer';

import 'package:get/get.dart';
import 'package:promptia/api/prompt_api.dart';
import 'package:promptia/routes/route_names.dart';
import 'package:promptia/services/supabase_service.dart';
import 'package:promptia/util/constants_widget.dart';

class PromptController extends GetxController {
  RxBool isLoading = false.obs;
  late PromptApi promptApi;

  @override
  void onInit() {
    promptApi = PromptApi(SupabaseService.supabase);

    super.onInit();
  }

  // * to create new prompt
  void store(String title, String prompt) async {
    try {
      isLoading.value = true;
      Map<String, dynamic> body = {
        "title": title,
        "prompt": prompt,
        "user_id": SupabaseService.supabase.auth.currentUser?.id
      };
      await promptApi.store(body);
      isLoading.value = false;
      Get.offNamed(RouteNames.home);
    } catch (e) {
      isLoading.value = false;
      log("The error is $e");
      getSnack("Error", "Something went wrong!");
    }
  }
}
