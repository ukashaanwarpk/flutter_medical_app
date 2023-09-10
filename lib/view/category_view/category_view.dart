import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_medical_app/consts/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../consts/list.dart';
import '../../consts/strings.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          AppStrings.category,
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: MediaQuery.sizeOf(context). height * 0.23,
            ),
            itemCount: iconList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){},
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color:AppColor.blueColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(iconList[index],
                          width: width * 0.20,
                          color: AppColor.whiteColor,
                        ),
                      ),
                      SizedBox(height:  height * 0.03,),
                      Text(iconTitleList[index], style: GoogleFonts.nunito(
                        color: AppColor.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height:  height * 0.01,),
                      Text("13 specialists", style: GoogleFonts.nunito(
                          fontSize: 16,
                          color: AppColor.whiteColor.withOpacity(0.5),
                          fontWeight: FontWeight.w600
                      ),),
                    ],
                  ),

                ),
              );
            }),
      ),
    );
  }
}
