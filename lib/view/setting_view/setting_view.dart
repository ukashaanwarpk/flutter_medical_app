import 'package:flutter/material.dart';
import 'package:flutter_medical_app/consts/images.dart';
import 'package:flutter_medical_app/consts/strings.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../consts/colors.dart';
import '../../consts/list.dart';


class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(AppStrings.setting,  style :GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Image.asset('assets/images/image_signup.png'),
            ),
            title: const Text("User Name"),
            subtitle: const Text("user@gmail.com"),
          ),
          const Divider(),
          SizedBox(height: height * 0.02,),
          ListView(
            shrinkWrap: true,
            children: List.generate(
                settingList.length, (index) => ListTile(
              onTap: (){},
              leading: Icon(settingListIcons[index], color: AppColor.blueColor,),
              title: Text(settingList[index], style: GoogleFonts.nunito(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),),
            )),
          )

        ],
      ),
    );
  }
}
