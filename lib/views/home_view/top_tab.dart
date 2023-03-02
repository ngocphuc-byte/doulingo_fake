import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 100.h,
        padding: EdgeInsets.only(left: 14.w, right: 14.w),
        decoration: BoxDecoration(
          color: Constant.subColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // color: Colors.amber,
                Lottie.asset(
                  'assets/images/logo_home.json',
                  fit: BoxFit.fitHeight,
                  width: 40.w,
                  height: 40.h,
                  repeat: false,
                ),
                Image.asset(
                  'assets/images/owl_logo.png',
                  width: 30.w,
                  height: 30.h,
                ),
              ],
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.menu,
                      color: Colors.lightBlue,
                      size: 28.sp,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Tiếng anh cơ bản',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                      color: Colors.lightBlue,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
