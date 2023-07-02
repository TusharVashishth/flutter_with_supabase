import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:promptia/features/prompts/controller/prompt_controller.dart';
import 'package:promptia/features/prompts/widgets/prompt_input.dart';
import 'package:promptia/util/style_constants.dart';

class AddPrompt extends StatefulWidget {
  const AddPrompt({super.key});

  @override
  State<AddPrompt> createState() => _AddPromptState();
}

class _AddPromptState extends State<AddPrompt> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController textController = TextEditingController(text: "");
  final TextEditingController titleController = TextEditingController(text: "");
  final PromptController controller = Get.put(PromptController());

  // * Submit the form
  void submit() {
    if (_form.currentState!.validate() && controller.isLoading.value == false) {
      controller.store(titleController.text, textController.text);
    }
  }

  @override
  void dispose() {
    textController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add prompt"),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        child: Form(
          key: _form,
          child: Column(
            children: [
              PromptInput(
                controller: titleController,
                hintText: "Type your prompt title",
                validatorCallback:
                    ValidationBuilder().minLength(5).maxLength(50).build(),
              ),
              const SizedBox(
                height: 20,
              ),
              PromptInput(
                controller: textController,
                hintText: "Type your prompt here..",
                validatorCallback:
                    ValidationBuilder().minLength(10).maxLength(500).build(),
                isPromptField: true,
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() => ElevatedButton(
                    onPressed: submit,
                    style: authButtonStyle(),
                    child: Text(
                      controller.isLoading.value ? "Loading.." : "Submit",
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
