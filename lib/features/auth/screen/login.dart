import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:promptia/features/auth/controller/auth_controller.dart';
import 'package:promptia/features/auth/widget/auth_input_field.dart';
import 'package:promptia/routes/route_names.dart';
import 'package:promptia/util/constants_widget.dart';
import 'package:promptia/util/style_constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    log("The user is");
    super.initState();
  }

  // * Form Key
  final AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");

  // * Validator Properties
  final emailValidator = ValidationBuilder().email().build();
  final passwordValidator =
      ValidationBuilder().minLength(6).maxLength(20).build();

  // * Login
  void login() async {
    if (_form.currentState!.validate() &&
        authController.loginLoading.value == false) {
      authController.login(emailController.text, passwordController.text);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _form,
            child: Column(
              children: [
                Align(alignment: Alignment.topLeft, child: brandName()),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Welcome back"),
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthInputField(
                  label: "Email",
                  hintText: "Type your email...",
                  controller: emailController,
                  validatorCallback: emailValidator,
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthInputField(
                  label: "Password",
                  hintText: "Type your password..",
                  controller: passwordController,
                  isPasswordField: true,
                  validatorCallback: passwordValidator,
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => ElevatedButton(
                    onPressed: login,
                    style: authButtonStyle(),
                    child: Text(
                      authController.loginLoading.value ? "Loading.." : "Login",
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("-- OR --"),
                const SizedBox(
                  height: 20,
                ),
                Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: "Sign up",
                      style: const TextStyle(fontWeight: FontWeight.w900),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed(RouteNames.signUp),
                    ),
                  ], text: "Don't have an account ?  "),
                )
                // RichText(
                //   text: const TextSpan(children: [
                //   ,
                //   ], text: "Don't have an account ?"),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
