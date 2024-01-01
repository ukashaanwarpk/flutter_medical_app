import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../consts/colors.dart';
import '../doctor_profile/doctor_profile.dart';

class SearchView extends StatelessWidget {
  final String searchQuery;
  const SearchView({Key? key, required this.searchQuery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Search Result",
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection("doctors").get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length ?? 0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: height * 0.26,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12),
                itemBuilder: (context, index) {
                  final docs = snapshot.data!.docs[index];

                  return !(docs['docName'].toString().toLowerCase())
                          .contains(searchQuery.toLowerCase())
                      ? Text(
                          "No Doctor Found",
                          style: GoogleFonts.nunito(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        )
                      : GestureDetector(
                          onTap: () {
                            Get.to(() => DoctorProfile(docs: docs));
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        docs['docName'],
                                        style: GoogleFonts.nunito(),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      RatingBar.builder(
                                          initialRating: double.parse(
                                              docs['docRating'].toString()),
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
