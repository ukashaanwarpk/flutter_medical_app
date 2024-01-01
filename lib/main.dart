import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical_app/consts/colors.dart';
import 'package:flutter_medical_app/firebase_options.dart';
import 'package:flutter_medical_app/view/splash/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
      child:  GetMaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.blue,
            iconTheme: IconThemeData(color: AppColor.whiteColor),
            titleTextStyle: TextStyle(color: AppColor.whiteColor)
          )
        ),
        debugShowCheckedModeBanner: false,
        title: 'Medical App',
        home: const SplashScreen(),
      ),
    );
  }
}
