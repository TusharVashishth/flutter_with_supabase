import 'package:get/get.dart';
import 'package:promptia/common/screen/page_loading.dart';
import 'package:promptia/features/auth/screen/login.dart';
import 'package:promptia/features/auth/screen/signup.dart';
import 'package:promptia/features/home/screen/home.dart';
import 'package:promptia/features/profile/screen/profile.dart';
import 'package:promptia/features/prompts/screen/add_prompt.dart';
import 'package:promptia/routes/route_names.dart';

class Routes {
  static final routes = [
    GetPage(
      name: RouteNames.home,
      page: () => Home(),
    ),
    GetPage(
      name: RouteNames.loadingPage,
      page: () => const PageLoading(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => const Login(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: RouteNames.signUp,
      page: () => const Signup(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: RouteNames.addPrompt,
      page: () => const AddPrompt(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: RouteNames.profile,
      page: () => const Profile(),
      transition: Transition.rightToLeft,
    ),
  ];
}
