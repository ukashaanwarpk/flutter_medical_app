import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical_app/consts/colors.dart';
import 'package:flutter_medical_app/res/component/custom_button.dart';
import 'package:flutter_medical_app/view/book_appointment/book_appointment.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorProfile extends StatelessWidget {
  final DocumentSnapshot docs;
  const DoctorProfile({Key? key, required this.docs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Doctor Details",
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                height: height * 0.12,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Image.asset('assets/images/image_signup.png'),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            docs['docName'],
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            docs['docCategory'],
                            style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColor.black54),
                          ),
                          const Spacer(),
                          RatingBar.builder(
                              initialRating: double.parse(docs['docRating'].toString()),
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
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See all reviews",
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.whiteColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        "Phone Number",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w600,
                            color: AppColor.black54),
                      ),
                      subtitle: Text(
                        docs['docPhone'],
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w600,
                            color: AppColor.black54.withOpacity(0.5)),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColor.ratingColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Icon(
                          Icons.phone,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(
                      "About",
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700, color: AppColor.black54),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      docs['docAbout'],
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w600,
                          color: AppColor.black54.withOpacity(0.5)),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(
                      "Address",
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700, color: AppColor.black54),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      docs['docAddress'],
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w600,
                          color: AppColor.black54.withOpacity(0.5)),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(
                      "Working Time",
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700, color: AppColor.black54),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      docs['docTiming'],
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w600,
                          color: AppColor.black54.withOpacity(0.5)),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Text(
                      "Service",
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700, color: AppColor.black54),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      docs['docService'],
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w600,
                          color: AppColor.black54.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: CustomButton(
          onPress: () {
            Get.to(() => BookAppointment(docId: docs['docId'], docName: docs['docName'],));
          },
          title: "Book an appointment",
          height: 60,
          width: double.infinity,
          buttonColor: AppColor.blueColor,
          textColor: AppColor.whiteColor,
          borderRadius: 50,
        ),
      ),
    );
  }
}
