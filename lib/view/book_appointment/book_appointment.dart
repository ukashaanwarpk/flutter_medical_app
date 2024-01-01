import 'package:flutter/material.dart';
import 'package:flutter_medical_app/controller/appointment_controller.dart';
import 'package:flutter_medical_app/res/component/custom_text_form_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../consts/colors.dart';
import '../../res/component/custom_button.dart';

class BookAppointment extends StatelessWidget {
  final String docId;
  final String docName;
  const BookAppointment({Key? key, required this.docId, required this.docName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          docName,
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select appointment day",
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w700, color: AppColor.black54),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextFormField(
                controller: controller.appDayController,
                hint: "Select day",
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "Select appointment time",
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w700, color: AppColor.black54),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextFormField(
                hint: "Select time",
                controller: controller.appTimeController,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "Mobile Number:",
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w700, color: AppColor.black54),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextFormField(
                hint: "Enter your mobile number",
                controller: controller.appMobileController,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "Full Name:",
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w700, color: AppColor.black54),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextFormField(
                hint: "Enter your name",
                controller: controller.appNameController,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "Message:",
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w700, color: AppColor.black54),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              CustomTextFormField(
                hint: "Enter your message",
                controller: controller.appMessageController,
              ),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(10),
          child: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : CustomButton(
                  onPress: () async {
                    await controller.bookAppointment(docId, docName, context);
                  },
                  title: "Confirm an appointment",
                  height: 60,
                  width: double.infinity,
                  buttonColor: AppColor.blueColor,
                  textColor: AppColor.whiteColor,
                  borderRadius: 50,
                ),
        ),
      ),
    );
  }
}
