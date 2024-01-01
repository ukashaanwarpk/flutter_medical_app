import 'package:flutter/material.dart';
import 'package:flutter_medical_app/consts/colors.dart';
import 'package:flutter_medical_app/view/book_appointment/appointment_view.dart';
import 'package:flutter_medical_app/view/category_view/category_view.dart';
import 'package:flutter_medical_app/view/login_view/login_view.dart';
import 'package:flutter_medical_app/view/setting_view/setting_view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

int selectedIndex = 0;

List screenList = [
  const HomeView(),
  const AppointmentView(),
  const CategoryView(),
  const SettingView(),
];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColor.whiteColor.withOpacity(0.5),
        selectedItemColor: AppColor.whiteColor,
        selectedLabelStyle: GoogleFonts.nunito(
          fontWeight: FontWeight.w600
        ),
        backgroundColor: AppColor.blueColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Appointment",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
