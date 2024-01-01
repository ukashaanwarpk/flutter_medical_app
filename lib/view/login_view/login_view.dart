import 'package:flutter/material.dart';
import 'package:flutter_medical_app/consts/colors.dart';
import 'package:flutter_medical_app/consts/strings.dart';
import 'package:flutter_medical_app/controller/auth_controller.dart';
import 'package:flutter_medical_app/res/component/custom_button.dart';
import 'package:flutter_medical_app/res/component/custom_text_form_field.dart';
import 'package:flutter_medical_app/view/book_appointment/appointment_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home_view/home.dart';
import '../signup_view/signup_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();
// final _formKey = GlobalKey<FormState>();
bool showPassword = false;
bool isDoctor = false;

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.whiteColor,
        body: Column(
          children: [
            Image.asset(
              'assets/images/image_login.jpg',
              width: width * 0.50,
            ),
            Text(
              AppStrings.welcomeBack,
              style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              AppStrings.weAreExcited,
              style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Column(children: [
              Form(
                // key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Column(
                    children: [
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
                        obscureText: !showPassword,
                        hint: AppStrings.password,
                        showThisField: true,
                        prefixIcon: Icons.lock_outline,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Icon(!showPassword
                              ? Icons.visibility_off
                              : Icons.remove_red_eye),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      SwitchListTile(value: isDoctor, onChanged: (value){
                        setState(() {
                          isDoctor = value;
                        });
                      },
                        title:  Text("Sign in as a doctor", style: GoogleFonts.nunito(fontWeight: FontWeight.w500),),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          AppStrings.forgetPassword,
                          style: GoogleFonts.nunito(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Obx(()=>
                         CustomButton(
                            title: AppStrings.login,
                            height: height * 0.07,
                            width: width * 0.70,
                            buttonColor: AppColor.primaryColor,
                            textColor: AppColor.whiteColor,
                            loading: controller.loading,
                            onPress: () async{
                              await controller.loginUser();
                              controller.setLoading(false);
                              if(controller.userCredential != null){
                                if(isDoctor){
                                  Get.to(() => const AppointmentView());
                                }
                                else{
                                  Get.to(() => const Home());
                                }

                              }
                            }),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const SignupView());
                        },
                        child: Text.rich(
                          TextSpan(
                            text: AppStrings.dontHaveAccount,
                            style: GoogleFonts.nunito(fontSize: 16),
                            children: [
                              WidgetSpan(
                                child: SizedBox(
                                  width: width * 0.02,
                                ),
                              ),
                              TextSpan(
                                text: AppStrings.signup,
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
            ]),
          ],
        ),
      ),
    );
  }
}
