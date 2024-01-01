import 'package:flutter/material.dart';
import 'package:flutter_medical_app/consts/colors.dart';
import 'package:flutter_medical_app/consts/images.dart';
import 'package:flutter_medical_app/consts/list.dart';
import 'package:flutter_medical_app/consts/strings.dart';
import 'package:flutter_medical_app/controller/home_controller.dart';
import 'package:flutter_medical_app/res/component/custom_text_form_field.dart';
import 'package:flutter_medical_app/view/category_view/category_details_view.dart';
import 'package:flutter_medical_app/view/doctor_profile/doctor_profile.dart';
import 'package:flutter_medical_app/view/search_view/search_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/controller.setting.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final controller = Get.put(HomeController());
    final sController = Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Obx(()=>
           Text("${AppStrings.welcome} ${sController.userName.value}",
              style: GoogleFonts.nunito(
                  fontSize: 16, fontWeight: FontWeight.bold,)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              color: AppColor.blueColor,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: controller.searchController,
                      keyboardType: TextInputType.text,
                      hint: AppStrings.searchDoctor,
                      textColor: AppColor.whiteColor,
                      borderColor: AppColor.whiteColor,
                      textFieldColor: AppColor.whiteColor,
                      showThisField: false,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(()=>SearchView(searchQuery: controller.searchController.text));
                    },
                    icon: Icon(
                      Icons.search,
                      color: AppColor.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.129,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(()=>CategoryDetailsView(catName: iconTitleList[index]));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColor.blueColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              height: height * 0.19,
                              width: width * 0.19,
                              child: Column(
                                children: [
                                  Image.asset(
                                    iconList[index],
                                    width: width * 0.35,
                                    color: AppColor.whiteColor,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Text(
                                    iconTitleList[index],
                                    style: GoogleFonts.nunito(
                                        color: AppColor.whiteColor),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppStrings.popularDoctor,
                        style: GoogleFonts.nunito(
                            color: AppColor.blueColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),),
                  SizedBox(
                    height: height * 0.02,
                  ),
                 FutureBuilder(
                   future: controller.getDoctorList(),
                     builder: (context, snapshot){
                   if(!snapshot.hasData){
                     return const Center(child: CircularProgressIndicator(
                       color: Colors.blue,
                     ),);
                   }
                   else{
                     final data = snapshot.data!.docs;
                    return  SizedBox(
                      height: height * 0.24,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                Get.to(()=> DoctorProfile(docs: data[index],));
                              },
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  color: AppColor.bgDarkColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: const EdgeInsets.only(right: 8),
                                height: height * 0.10,
                                width: width * 0.40,
                                child: Column(
                                  children: [
                                    Container(
                                      width: width * 0.90,
                                      color: AppColor.blueColor,
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        'assets/images/image_signup.png',
                                        width: width * 0.30,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Text(
                                      data[index]['docName'],
                                      style: GoogleFonts.nunito(),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Text(
                                      data[index]['docCategory'],
                                      style: GoogleFonts.nunito(
                                        color: AppColor.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                   }
                 }),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        AppStrings.viewAll,
                        style: GoogleFonts.nunito(
                          color: AppColor.blueColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children : List.generate(4, (index) => Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.blueColor,
                        ),
                        child: Column(
                          children: [
                            Image.asset(AppAssets.icBody, width: width * 0.09, color: AppColor.whiteColor,),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            Text("Lab Test", style: GoogleFonts.nunito(color: AppColor.whiteColor),),
                          ],
                        ),

                      ),
                    ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
