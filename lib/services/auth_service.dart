import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService extends GetxService {
  final SupabaseClient supabaseClient;
  AuthService(this.supabaseClient);

  // * get user name
  String userName() => supabaseClient.auth.currentUser?.userMetadata?["name"];
}
