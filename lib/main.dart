import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_one/constants/strings.const.dart';
import 'routing/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      // home: const HomeScreen(),
      initialRoute: RouteHelper.getSplashScreen(),
      getPages: RouteHelper.routes,
    );
  }
}
