import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;

  const CommonTextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    required this.textColor,
    required this.fontWeight,
    this.textAlign,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
      ),
    );
  }
}
