import 'dart:developer';

import 'package:get/get.dart';
import 'package:promptia/api/auth_api.dart';
import 'package:promptia/routes/route_names.dart';
import 'package:promptia/services/supabase_service.dart';
import 'package:promptia/util/constants_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  late AuthApi authApi;

  @override
  void onInit() {
    authApi = AuthApi(SupabaseService.supabase);

    super.onInit();
  }

  RxBool isLoading = false.obs;
  RxBool loginLoading = false.obs;
  // * Login method
  void login(String email, String password) async {
    try {
      loginLoading.value = true;
      await authApi.login(email, password);
      loginLoading.value = false;
    } catch (e) {
      loginLoading.value = false;
      getSnack("Error", "Something went wrong!");
    }
  }

// * Sign up method
  void signup(String name, String email, String password) async {
    try {
      isLoading.value = true;
      final AuthResponse response = await authApi.signUp(name, email, password);
      isLoading.value = false;
      getSnack("Success", "User created successfully!");
      Get.toNamed(RouteNames.login);
      log("Supabase signup response ${response.session?.toJson()} , ${response.user?.toJson()}");
    } catch (e) {
      isLoading.value = false;
      log("The error is $e");
      getSnack("Error", "Something went wrong!");
    }
  }
}
