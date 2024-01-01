
import 'package:flutter/material.dart';
import 'package:flutter_medical_app/consts/strings.dart';
import 'package:flutter_medical_app/controller/auth_controller.dart';
import 'package:flutter_medical_app/view/login_view/login_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../consts/colors.dart';
import '../../consts/list.dart';
import '../../controller/controller.setting.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;

    final controller = Get.put(SettingController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppStrings.setting,
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(color: Colors.blue,),
              )
            : Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Image.asset('assets/images/image_signup.png'),
                    ),
                    title: Text(controller.userName.value),
                    subtitle: Text(controller.email.value),
                  ),
                  const Divider(),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: List.generate(
                      settingList.length,
                      (index) => ListTile(
                        onTap: () async {
                          if (index == 2) {
                            await AuthController().signOut();
                            Get.offAll(() => const LoginView());
                          }
                        },
                        leading: Icon(
                          settingListIcons[index],
                          color: AppColor.blueColor,
                        ),
                        title: Text(
                          settingList[index],
                          style: GoogleFonts.nunito(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
