import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../consts/colors.dart';

class AppointmentDetails extends StatelessWidget {
  final DocumentSnapshot docs;
  const AppointmentDetails({Key? key, required this.docs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          docs['appWithDoc'],
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
            Text(
              docs['appDay'],
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w500, color: AppColor.black54),
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
            Text(
              docs['appTime'],
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w500, color: AppColor.black54),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Mobile Number",
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w700, color: AppColor.black54),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              docs['appMobile'],
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w500, color: AppColor.black54),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Full Name",
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w700, color: AppColor.black54),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              docs['appName'],
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w500, color: AppColor.black54),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              "Message",
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w700, color: AppColor.black54),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              docs['appMesg'],
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w500, color: AppColor.black54),
            ),
          ],
        ),
      ),
    );
  }
}
