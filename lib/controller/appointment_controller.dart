import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AppointmentController extends GetxController {
  final isLoading = false.obs;
  final appDayController = TextEditingController();
  final appTimeController = TextEditingController();
  final appMobileController = TextEditingController();
  final appNameController = TextEditingController();
  final appMessageController = TextEditingController();
  final isDoctor = false;


  bookAppointment(String docId, String docName, context) async {
    try {
      isLoading(true);
      final store = FirebaseFirestore.instance.collection("appointments").doc();
      await store.set({
        'appBy': FirebaseAuth.instance.currentUser!.uid,
        'appDay': appDayController.text,
        'appTime': appTimeController.text,
        'appMobile': appMobileController.text,
        'appName': appNameController.text,
        'appMesg': appMessageController.text,
        'appWith': docId,
        'appWithDoc': docName,
      });
      isLoading(false);
      log("Doc Id and appWithDoc $docId $docName");

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Appointment is booked Successfully")));
      Get.back();
    } catch (e) {
      log("error in bookings $e");
    }
  }


  // Future<QuerySnapshot<Map<String, dynamic>>> getAppointmentList(bool isDoctor) async {
  //   if(isDoctor){
  //     return await FirebaseFirestore.instance
  //         .collection("appointments")
  //         .where('appWith', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //         .get();
  //   }
  //   else{
  //     return await FirebaseFirestore.instance
  //         .collection("appointments")
  //         .where('appBy', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //         .get();
  //   }
  //
  // }

  // Future<QuerySnapshot<Map<String, dynamic>>> getAppointmentList(bool isDoctor) async {
  //   try {
  //     final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
  //     log("Getting appointments for user: $currentUserUid, isDoctor: $isDoctor");
  //
  //     final querySnapshot = await FirebaseFirestore.instance
  //         .collection("appointments")
  //         .get();
  //
  //     log("All Appointments data: ${querySnapshot.docs}");
  //
  //     return querySnapshot;
  //   } catch (e) {
  //     log("Error getting appointments: $e");
  //     rethrow;
  //   }
  //}

  Future<QuerySnapshot<Map<String, dynamic>>> getAppointmentList(isDoctor) async {
    try {
      final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
      log("Getting appointments for user: $currentUserUid, isDoctor: $isDoctor");

      QuerySnapshot<Map<String, dynamic>> querySnapshot;

      if (isDoctor) {
        querySnapshot = await FirebaseFirestore.instance
            .collection("appointments")
            .where('appWith', isEqualTo: currentUserUid)
            .get();
      } else {
        querySnapshot = await FirebaseFirestore.instance
            .collection("appointments")
            .where('appBy', isEqualTo: currentUserUid)
            .get();
      }

      log("Appointments data: ${querySnapshot.docs}");

      return querySnapshot;
    } catch (e) {
      log("Error getting appointments: $e");
      rethrow;
    }
  }

  // Future<QuerySnapshot<Map<String, dynamic>>> getAppointmentList(bool isDoctor) async {
  //   try {
  //     final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
  //     log("Getting all appointments for user: $currentUserUid, isDoctor: $isDoctor");
  //
  //     final querySnapshot = await FirebaseFirestore.instance
  //         .collection("appointments")
  //         .get();
  //
  //     log("All Appointments data: ${querySnapshot.docs}");
  //
  //     return querySnapshot;
  //   } catch (e) {
  //     log("Error getting all appointments: $e");
  //     rethrow;
  //   }
  // }


}
