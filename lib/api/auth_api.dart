import 'package:supabase_flutter/supabase_flutter.dart';

class AuthApi {
  final SupabaseClient supabaseClient;

  AuthApi(this.supabaseClient);

  Future<AuthResponse> login(String email, String password) async {
    final AuthResponse response = await supabaseClient.auth
        .signInWithPassword(email: email, password: password);
    return response;
  }

  // * To create user new account
  Future<AuthResponse> signUp(
      String name, String email, String password) async {
    final AuthResponse response = await supabaseClient.auth.signUp(
      email: email,
      password: password,
      data: {"name": name},
    );
    return response;
  }

  // * Fetch the user
  Future<List<dynamic>> getUser(String id) async {
    var response = await supabaseClient
        .from('users')
        .select("metadata ,email")
        .match({"id": id});
    return response;
  }
}
