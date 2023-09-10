import 'package:flutter/material.dart';
import 'package:flutter_medical_app/consts/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final VoidCallback? onPress;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final Color textColor;
  final Color borderColor;
  final bool obscureText;

  const CustomTextFormField({
    Key? key,
    required this.hint,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    required this.keyboardType,
    this.onPress,
    this.textColor = Colors.black,
    this.borderColor = Colors.black,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.blueColor,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
        hintText: hint,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
        hintStyle: GoogleFonts.nunito(color: textColor),
        suffixIcon: suffixIcon,
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}
