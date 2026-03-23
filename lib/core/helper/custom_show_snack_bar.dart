import 'package:flutter/material.dart';

void customShowSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
      content: Text(message),
    ),
  );
}
