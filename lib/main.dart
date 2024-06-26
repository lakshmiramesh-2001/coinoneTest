import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:task_imagelist/constance/app_colors.dart';
import 'package:task_imagelist/routers/routers.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.themeColor,
        appBarTheme: AppBarTheme(backgroundColor: AppColors.themeColor)
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.WELCOME,
      getPages: AppPages.pages,
    );
  }
}
