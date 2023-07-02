import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:promptia/routes/route_names.dart';
import 'package:promptia/util/constants.dart';

AppBar customAppBar() {
  return AppBar(
    title: const Text(
      appName,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    elevation: 0,
    forceMaterialTransparency: true,
    centerTitle: false,
    actions: [
      TextButton(
          onPressed: () => Get.toNamed(RouteNames.profile),
          child: const Text(
            "Profile",
            style: TextStyle(
              color: Colors.black,
            ),
          ))
    ],
  );
}

Text brandName() => const Text(
      appName,
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );

// * Getx Snackbar
void getSnack(String title, String message) => Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      colorText: Colors.white,
    );
