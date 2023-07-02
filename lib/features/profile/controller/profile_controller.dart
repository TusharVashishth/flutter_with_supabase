import 'dart:developer';

import 'package:get/get.dart';
import 'package:promptia/api/prompt_api.dart';
import 'package:promptia/common/model/prompt_model.dart';
import 'package:promptia/routes/route_names.dart';
import 'package:promptia/services/supabase_service.dart';
import 'package:promptia/util/constants_widget.dart';

class ProfileController extends GetxController {
  late PromptApi promptApi;
  RxBool isLoading = false.obs;
  RxBool notFound = false.obs;
  RxList<PromptModel> prompts = [PromptModel()].obs;

  @override
  void onInit() {
    promptApi = PromptApi(SupabaseService.supabase);
    fetchPropmpts();
    super.onInit();
  }

  void fetchPropmpts() async {
    isLoading.value = true;
    List<dynamic> response = await promptApi.fetchUserPropmpts();
    if (response.isNotEmpty) {
      prompts.value = [for (var item in response) PromptModel.fromJson(item)];
      isLoading.value = false;
    } else {
      isLoading.value = false;
      notFound.value = true;
    }
  }

// * delete the prompt
  void deletePrompt(PromptModel promptModel) async {
    try {
      prompts.remove(promptModel);
      await promptApi.deletePrompt(promptModel.id!);
      getSnack("Success", "Prompt Deleted successfully!");
    } catch (e) {
      getSnack("Error", "Something went wrong!");
      log("The error is $e");
    }
  }

  // * Log Out the user
  void logOut() async {
    if (SupabaseService.supabase.auth.currentSession != null) {
      await SupabaseService.supabase.auth.signOut();
      return Get.offAllNamed(RouteNames.login);
    }
  }
}
