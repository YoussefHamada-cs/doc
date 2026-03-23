import 'package:duc/core/di/get_it_sevice.dart';
import 'package:duc/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  runApp(const DocApp());
}
