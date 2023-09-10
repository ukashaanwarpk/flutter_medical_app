import 'package:flutter/material.dart';
import 'package:flutter_medical_app/consts/colors.dart';
import 'package:flutter_medical_app/consts/strings.dart';
import 'package:flutter_medical_app/res/component/custom_button.dart';
import 'package:flutter_medical_app/res/component/custom_text_form_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../signup_view/signup_screen.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

final nameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();

final _formKey = GlobalKey<FormState>();

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if(!currentFocus.hasPrimaryFocus){
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/image_signup.png',
                width: width * 0.50,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                AppStrings.signupNow,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,

                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Column(
                    children: [
                      CustomTextFormField(
                        keyboardType: TextInputType.text,
                        controller: nameController,
                        hint: AppStrings.fullName,
                        prefixIcon: Icons.person_outline,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomTextFormField(
                        keyboardType: TextInputType.text,
                        controller: emailController,
                        hint: AppStrings.email,
                        prefixIcon: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomTextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.number,
                        hint: AppStrings.password,
                        prefixIcon: Icons.lock_outline,
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      CustomButton(
                          title: AppStrings.signup,
                          height: height * 0.07,
                          width: width * 0.70,
                          buttonColor: AppColor.primaryColor,
                          textColor: AppColor.whiteColor,
                          onPress: () {}),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      GestureDetector(
                        onTap: () {
                         Get.back();
                        },
                        child: Text.rich(
                          TextSpan(
                              text: AppStrings.alreadyHaveAccount,
                              style: GoogleFonts.nunito(fontSize: 16),
                              children: [
                                WidgetSpan(
                                  child: SizedBox(
                                    width: width * 0.015,
                                  ),
                                ),
                                TextSpan(
                                  text: AppStrings.login,
                                  style: GoogleFonts.nunito(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
