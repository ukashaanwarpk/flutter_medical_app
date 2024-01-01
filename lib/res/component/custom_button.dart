import 'package:flutter/material.dart';
import 'package:flutter_medical_app/consts/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool loading;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPress;
  final double height;
  final double width;
  final double? borderRadius;

  const CustomButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.buttonColor,
    required this.textColor,
    required this.onPress,
    required this.height,
    required this.width,
    this.borderRadius = 13,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius!),
          color: buttonColor,
        ),
        child: loading ? Center(
          child: CircularProgressIndicator(
                  color: AppColor.whiteColor,
                ),
        )
            : Center(
                child: Text(
                  title,
                  style: GoogleFonts.nunito(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
              ),
      ),
    );
  }
}
