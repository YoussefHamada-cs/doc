import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:duc/core/di/get_it_sevice.dart';
import 'package:duc/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
 
  await Firebase.initializeApp();

 
  if (appFlavor == 'production') {
    
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  } else if (appFlavor == 'developer') {
   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  }

  // 3. التقاط أخطاء Flutter Framework (مثل أخطاء الـ UI)
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  // 4. التقاط الأخطاء التي تحدث خارج Flutter (مثل أخطاء الـ Async)
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  
  runApp(const DocApp());
}