import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final aboutController = TextEditingController();
  final categoryController = TextEditingController();
  final serviceController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final timingController = TextEditingController();

  final passwordController = TextEditingController();


  UserCredential? userCredential;

  final RxBool _loading = false.obs; // Use RxBool for reactive updates
  bool get loading => _loading.value; // Access value property

  setLoading(bool value) {
    _loading.value = value; // Update value property

    update(); // Notify listeners using GetX update
  }

  loginUser() async {
    try {
      setLoading(true);
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      setLoading(false);

      log(e.toString());
    }
  }

  signUpUser(bool isDoctor) async {
    try {
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: emailController.text,
          password: passwordController.text);
      await storeUserData(
        userCredential!.user!.uid,
        fullNameController.text,
        emailController.text,
        isDoctor
      );
    } catch (e) {
      log("Error in signUp $e");
    }
  }

  storeUserData(String uid, String fullName, String email, bool isDoctor) async {
    var store = FirebaseFirestore.instance.collection(isDoctor ? 'doctors' : "user").doc(uid);
    log("isDocINStoreUserData $isDoctor");
    if(isDoctor){
      await store.set({
        'docAbout' : aboutController.text,
        'docAddress' : addressController.text,
        'docCategory' : categoryController.text,
        'docName' : fullName,
        'docPhone' : phoneNumberController.text,
        'docService' : serviceController.text,
        'docTiming': timingController.text,
        'docId': FirebaseAuth.instance.currentUser?.uid,
        'docRating' : 4.5,
        'docEmail': email

      });
    }
    else {
      await store.set({
        "fullName": fullName,
        "email": email,
      });

    }

  }

  signOut() async {
    try{
      await FirebaseAuth.instance.signOut();
    }
    catch(e) {
      log("error is log out $e");
    }

  }
}
