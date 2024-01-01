import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical_app/view/doctor_profile/doctor_profile.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../consts/colors.dart';


class CategoryDetailsView extends StatelessWidget {
  final String catName;
  const CategoryDetailsView({Key? key, required this.catName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          catName,
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("doctors").where('docCategory', isEqualTo: catName).get(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator(),);
          }
          else{
            final data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: data.length ?? 0,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: height * 0.26,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12
                  ),
                  itemBuilder: (context, index){
                    return  GestureDetector(
                      onTap: (){
                        Get.to(()=>DoctorProfile(docs: data[index]));
                      },
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: AppColor.bgDarkColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[index]['docName'],
                                    style: GoogleFonts.nunito(),
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  RatingBar.builder(
                                      initialRating: double.parse(data[index]['docRating'].toString()),
                                      minRating: 1,
                                      maxRating: 5,
                                      itemCount: 5,
                                      itemSize: 20,
                                      itemBuilder: (_, index) {
                                        return Icon(
                                          Icons.star,
                                          color: AppColor.ratingColor,
                                        );
                                      },
                                      onRatingUpdate: (rating) {}),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    );

                  },
                  ),
            );
          }
        },
      ),
    );
  }
}
