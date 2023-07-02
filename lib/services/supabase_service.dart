import 'package:get/get.dart';
import 'package:promptia/routes/route_names.dart';
import 'package:promptia/services/storage_service.dart';
import 'package:promptia/util/storage_constants.dart';
import 'package:promptia/util/supabase_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService extends GetxService {
  @override
  void onInit() async {
    await Supabase.initialize(
      url: SupabaseConstants.projectUrl,
      anonKey: SupabaseConstants.projectKey,
    );

    listenAuthChanges();
    super.onInit();
  }

// * Initilize the supabase client
  static final SupabaseClient supabase = Supabase.instance.client;

  // * Listern the auth changes
  void listenAuthChanges() async {
    SupabaseService.supabase.auth.onAuthStateChange.listen((data) {
      if (data.event == AuthChangeEvent.signedOut) {
        StorageService.box.remove(authUserKey);
        Get.offAll(RouteNames.login);
      } else if (data.event == AuthChangeEvent.signedIn) {
        StorageService.box.write(authUserKey, data.session);
        Get.offNamed(RouteNames.home);
      } else if (data.event == AuthChangeEvent.tokenRefreshed) {
        StorageService.box.remove(authUserKey);
        Get.offAll(RouteNames.login);
      }
    });
  }
}
