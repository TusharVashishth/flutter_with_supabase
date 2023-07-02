import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promptia/common/model/prompt_model.dart';
import 'package:promptia/util/constants_widget.dart';
import 'package:promptia/util/helpers.dart';

class PromptCard extends StatelessWidget {
  final PromptModel promptModel;
  const PromptCard({
    super.key,
    required this.promptModel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(promptModel.users!.metadata!.name!),
            subtitle: Text(formatDateTime(promptModel.createdAt!)),
            trailing: IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: promptModel.prompt!));
                  getSnack(
                    "Wooo",
                    "prompt copied !!",
                  );
                },
                icon: const Icon(Icons.copy)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  promptModel.title!,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(promptModel.prompt!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
