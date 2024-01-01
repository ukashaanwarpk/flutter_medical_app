import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  @override
  void onInit() {
     getData = getUserData();
    super.onInit();
  }

  var isLoading = false.obs;
  final currentUser = FirebaseAuth.instance.currentUser;
  final userName = ''.obs;
  final email = ''.obs;
  Future? getData;

  getUserData() async {
    isLoading(true);
    var user = await FirebaseFirestore.instance
        .collection("user")
        .doc(currentUser!.uid)
        .get();

    final userData = user.data();
    log("userData = $userData");


    userName.value = userData?['fullName'] ?? '';
    email.value = currentUser!.email ?? '';

    isLoading(false);
  }
}
