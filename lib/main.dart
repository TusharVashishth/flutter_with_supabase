import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:promptia/routes/route_names.dart';
import 'package:promptia/routes/routes.dart';
import 'package:promptia/services/storage_service.dart';
import 'package:promptia/services/supabase_service.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // * Initilized the storage
  await GetStorage.init();
  await Get.putAsync<SupabaseService>(() async => SupabaseService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Promptia',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Colors.black),
        textTheme: GoogleFonts.specialEliteTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      getPages: Routes.routes,
      defaultTransition: Transition.noTransition,
      initialRoute: StorageService.userSession != null
          ? RouteNames.home
          : RouteNames.login,
    );
  }
}
