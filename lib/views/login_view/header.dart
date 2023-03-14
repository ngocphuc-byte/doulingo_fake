import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 250.h,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150.h,
            width: double.maxFinite,
            child: Lottie.asset(
              'assets/images/login_logo.json',
              repeat: false,
            ),
          ),
          Container(
            height: 100.h,
            padding: EdgeInsets.only(left: 30.w, right: 30.w),
            width: double.maxFinite,
            alignment: Alignment.center,
            child: Text(
              title,
              style: GoogleFonts.sourceSans3(
                fontSize: Constant.largeTextSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
