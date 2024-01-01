
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

final searchController = TextEditingController();

Future<QuerySnapshot<Map<String, dynamic>>>  getDoctorList()async{
    final doctors = await FirebaseFirestore.instance.collection("doctors").get();
    return doctors;
  }
}