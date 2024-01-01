import 'package:flutter/material.dart';
import 'package:flutter_medical_app/consts/colors.dart';
import 'package:flutter_medical_app/consts/strings.dart';
import 'package:flutter_medical_app/controller/auth_controller.dart';
import 'package:flutter_medical_app/res/component/custom_button.dart';
import 'package:flutter_medical_app/res/component/custom_text_form_field.dart';
import 'package:flutter_medical_app/view/home_view/home.dart';
import 'package:flutter_medical_app/view/splash/splash_service.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  // final _formKey = GlobalKey<FormState>();
  var isDoctor = false;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
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
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Column(
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
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.0),
                      child: Column(
                        children: [
                          CustomTextFormField(
                            keyboardType: TextInputType.text,
                            controller: controller.fullNameController,
                            hint: AppStrings.fullName,
                            prefixIcon: Icons.person_outline,
                            showThisField: true,

                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomTextFormField(
                            keyboardType: TextInputType.text,
                            controller: controller.emailController,
                            hint: AppStrings.email,
                            prefixIcon: Icons.email_outlined,
                            showThisField: true,
                          ),

                          SizedBox(
                            height: height * 0.02,
                          ),
                          CustomTextFormField(
                            controller: controller.passwordController,
                            keyboardType: TextInputType.number,
                            hint: AppStrings.password,
                            prefixIcon: Icons.lock_outline,
                            showThisField: true,
                          ),
                          SwitchListTile(title: const Text('Sign up as a doctor'),value: isDoctor, onChanged: (value){
                            setState(() {
                              isDoctor = value;
                            });

                          }),
                          Visibility(
                            visible: isDoctor,
                            child: Column(
                              children: [
                                SizedBox(height: height * 0.02,),
                                CustomTextFormField(
                                  keyboardType: TextInputType.multiline,
                                  controller: controller.aboutController,
                                  hint: AppStrings.about,
                                  prefixIcon: Icons.info_outline,
                                  showThisField: true,
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                CustomTextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: controller.serviceController,
                                  hint: AppStrings.service,
                                  prefixIcon: Icons.medical_services_outlined,
                                  showThisField: true,
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                CustomTextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: controller.addressController,
                                  hint: AppStrings.address,
                                  prefixIcon: Icons.home_outlined,
                                  showThisField: true,
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                CustomTextFormField(
                                  keyboardType: TextInputType.text,
                                  controller: controller.categoryController,
                                  hint: AppStrings.category,
                                  prefixIcon: Icons.category_outlined,
                                  showThisField: true,
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                CustomTextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: controller.phoneNumberController,
                                  hint: AppStrings.phoneNumber,
                                  prefixIcon: Icons.phone_outlined,
                                  showThisField: true,
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                CustomTextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: controller.timingController,
                                  hint: AppStrings.timing,
                                  prefixIcon: Icons.timer_outlined,
                                  showThisField: true,
                                ),
                              ],
                            ),
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
                              onPress: ()async {
                               await controller.signUpUser(isDoctor);
                                if(controller.userCredential != null){
                                  Get.offAll(()=>const Home());
                                }
                              }
                          ),
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
                                  ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




