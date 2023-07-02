import 'package:supabase_flutter/supabase_flutter.dart';

class PromptApi {
  final SupabaseClient supabaseClient;
  final String _tableName = "prompts";

  PromptApi(this.supabaseClient);

// * create new prompt
  Future<void> store(Map<String, dynamic> prompt) async {
    var response = await supabaseClient.from(_tableName).insert(prompt);
    return response;
  }

  // * update the prompt
  Future<void> update(int id, Map<String, dynamic> body) async {
    var response =
        await supabaseClient.from(_tableName).update(body).match({'id': id});
    return response;
  }

  // * Delete the prompt
  Future<void> deletePrompt(int id) async {
    await supabaseClient.from(_tableName).delete().match({"id": id});
  }

  // * fetch all prompts
  Future<List<dynamic>> fetchPropmpts() async {
    List<dynamic> response = await supabaseClient
        .from('prompts')
        .select('''id , title ,user_id , prompt ,created_at ,users:user_id (metadata ,email)''').order(
            'id',
            ascending: false);
    return response;
  }

  // * Fetch specific user prompt
  Future<List<dynamic>> fetchUserPropmpts() async {
    List<dynamic> response = await supabaseClient.from('prompts').select(
        '''id , title ,user_id , prompt ,created_at ,users:user_id (metadata ,email)''').match({
      "user_id": supabaseClient.auth.currentUser?.id
    }).order("id", ascending: false);
    return response;
  }
}
