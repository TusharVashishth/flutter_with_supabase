import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:promptia/features/auth/controller/auth_controller.dart';
import 'package:promptia/features/auth/widget/auth_input_field.dart';
import 'package:promptia/routes/route_names.dart';
import 'package:promptia/util/constants_widget.dart';
import 'package:promptia/util/style_constants.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController(text: "");
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");
  final TextEditingController cpasswordController =
      TextEditingController(text: "");
  final AuthController authController = Get.put(AuthController());

// * sign up method
  void signUp() {
    if (_form.currentState!.validate()) {
      authController.signup(
        nameController.text,
        emailController.text,
        passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _form,
            child: Column(
              children: [
                Align(alignment: Alignment.topLeft, child: brandName()),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Welcome to the world of AI chats prompts"),
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthInputField(
                  label: "Name",
                  hintText: "Type your name...",
                  controller: nameController,
                  validatorCallback:
                      ValidationBuilder().minLength(2).maxLength(50).build(),
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthInputField(
                  label: "Email",
                  hintText: "Type your email...",
                  controller: emailController,
                  validatorCallback: ValidationBuilder().email().build(),
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthInputField(
                  label: "Password",
                  hintText: "Type your password..",
                  controller: passwordController,
                  validatorCallback:
                      ValidationBuilder().minLength(6).maxLength(20).build(),
                  isPasswordField: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthInputField(
                  label: "Confirm Password",
                  hintText: "Type your password..",
                  controller: cpasswordController,
                  validatorCallback: (value) {
                    if (value != passwordController.text) {
                      return 'Confirm Password do not match';
                    }
                    return null;
                  },
                  isPasswordField: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => ElevatedButton(
                    onPressed: signUp,
                    style: authButtonStyle(),
                    child: Text(
                      authController.isLoading.value ? 'Loading ...' : 'Signup',
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
                      text: "Login",
                      style: const TextStyle(fontWeight: FontWeight.w900),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed(RouteNames.login),
                    ),
                  ], text: "Already have an account ?  "),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
