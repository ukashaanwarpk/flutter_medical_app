import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_medical_app/view/book_appointment/appointment_view.dart';
import 'package:flutter_medical_app/view/home_view/home.dart';
import 'package:flutter_medical_app/view/login_view/login_view.dart';
import 'package:get/get.dart';



class SplashServices{

  FirebaseAuth auth = FirebaseAuth.instance;


  void isLogin(){
    auth.authStateChanges().listen((User? user) async{
      if(user != null){
        var data = await FirebaseFirestore.instance.collection('doctors').doc(user.uid).get();

        var isDoc = data.data()?.containsKey('docName') ?? false;

        log("isDoc $isDoc ");

        if(isDoc){
          Get.offAll(()=>const AppointmentView());
        }
        else{
          Timer(const Duration(seconds: 3), () {
            Get.offAll(()=>const Home());
          });
        }
      }
      else{
        Timer(const Duration(seconds: 3), () {
          Get.offAll(()=>const LoginView());
        });
      }
    });


  }
}