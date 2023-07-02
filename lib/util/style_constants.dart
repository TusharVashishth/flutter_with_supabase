import 'package:flutter/material.dart';

ButtonStyle authButtonStyle({
  Color bgColor = Colors.black,
  Color textColor = Colors.white,
}) {
  return ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(bgColor),
    foregroundColor: MaterialStateProperty.all<Color>(textColor),
    minimumSize: MaterialStateProperty.all<Size>(
      const Size.fromHeight(40.0),
    ),
  );
}
