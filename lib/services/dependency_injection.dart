import 'package:get/get.dart';
import 'package:promptia/services/supabase_service.dart';

class DependencyInjection {
  static void init() async {
    await Get.putAsync<SupabaseService>(() async => SupabaseService());
    Get.put<GetConnect>(GetConnect());
  }
}
