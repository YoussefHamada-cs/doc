import 'package:duc/core/routing/app_router.dart';
import 'package:duc/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        theme: ThemeData(
         primaryColor: AppColors.mainBlue,
        ),
      debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          
     ), );
  }
}
