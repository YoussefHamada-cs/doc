import 'package:duc/core/di/get_it_sevice.dart';
import 'package:duc/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await ScreenUtil.ensureScreenSize();

  if (appFlavor == 'production') {
    
  } else if (appFlavor == 'developer') {
    
  }

 
  setupGetIt();
  
  runApp(const DocApp());
}
