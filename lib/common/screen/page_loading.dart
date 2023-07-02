import 'package:flutter/material.dart';
import 'package:promptia/common/widgets/loader.dart';

class PageLoading extends StatelessWidget {
  const PageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Loader(),
              SizedBox(
                height: 10,
              ),
              Text("Loading ..."),
            ],
          ),
        ),
      ),
    );
  }
}
