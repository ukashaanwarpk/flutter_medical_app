import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool loading;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPress;
  final double height;
  final double width;

  const CustomButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.buttonColor,
    required this.textColor,
    required this.onPress,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: buttonColor,
        ),
        child: loading
            ? CircularProgressIndicator(
                color: Colors.deepPurple.shade200,
              )
            : Center(
                child: Text(title,
                    style: GoogleFonts.nunito(
                      color: textColor,
                      fontSize: 16,
                    ))),
      ),
    );
  }
}
