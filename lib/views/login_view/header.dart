import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 150.h,
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
        ],
      ),
    );
  }
}
