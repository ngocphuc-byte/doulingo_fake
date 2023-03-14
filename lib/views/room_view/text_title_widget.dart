import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextTitleWidget extends StatelessWidget {
  TextTitleWidget({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 75.h,
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: GoogleFonts.sourceSans3(
          fontSize: Constant.mediumTextSize,
          color: Constant.white,
          fontWeight: Constant.boldWeight,
        ),
      ),
    );
  }
}
