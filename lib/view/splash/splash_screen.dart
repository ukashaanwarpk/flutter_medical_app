import 'package:flutter/material.dart';
import 'package:flutter_medical_app/controller/auth_controller.dart';
import 'package:flutter_medical_app/view/splash/splash_service.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../consts/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices services = SplashServices();

  @override
  void initState() {
    services.isLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              height: 200,
              'assets/images/logo.png',
            ),
          ),
          const SizedBox(height: 50,),
          Text("Doctor Appointment App", style: GoogleFonts.nunito(fontWeight: FontWeight.w700, fontSize: 16),),

        ],
      ),
    );
  }
}
