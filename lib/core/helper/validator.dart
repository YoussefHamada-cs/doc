import 'package:flutter/services.dart';

class NoArabicInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final arabicRegex = RegExp(r'[\u0600-\u06FF]');
    if (arabicRegex.hasMatch(newValue.text)) {
      return oldValue;
    }
    return newValue;
  }
}

class Validator {
  // 🔹 Username
  static String? username(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter username";
    }
    if (value.length < 4 || value.length > 16) {
      return "4–16 chars";
    }
    final regex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!regex.hasMatch(value)) {
      return "Only letters, numbers, _";
    }
    return null;
  }

  // 🔹 Phone Number
  static String? phoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter phone number";
    }

    final digitsOnly = value.replaceAll(RegExp(r'[\s\-\(\)]'), '');

    if (!RegExp(r'^\+?[0-9]+$').hasMatch(digitsOnly)) {
      return "Numbers only";
    }

    if (digitsOnly.startsWith('+')) {
      if (digitsOnly.length < 9 || digitsOnly.length > 16) {
        return "Invalid international number";
      }
    } else {
      if (digitsOnly.length < 11 || digitsOnly.length > 11) {
        return "11 digits required";
      }
    }

    return null;
  }

  // 🔹 Email
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Enter email";
    }
    if (value.length > 50) {
      return "Too long";
    }
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(value)) {
      return "Invalid email";
    }
    return null;
  }

  // 🔹 Password
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter password";
    }
    if (value.length < 6 || value.length > 20) {
      return "6–20 chars";
    }
    final regex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*])[A-Za-z\d!@#\$%^&*]{6,20}$',
    );
    if (!regex.hasMatch(value)) {
      return "Must have A-Z, a-z, 0-9, symbol";
    }
    return null;
  }
}
