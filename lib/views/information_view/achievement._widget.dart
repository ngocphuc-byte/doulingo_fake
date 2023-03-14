import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AchievementWidget extends StatelessWidget {
  const AchievementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.sp),
              child: Image.network(
                  'https://wallpapercave.com/dwp1x/wp4278771.png'),
            ),
          ),
          Container(
            width: 200.w,
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Học giả',
                    style: GoogleFonts.sourceSans3(
                      fontWeight: FontWeight.bold,
                      color: Constant.white,
                      fontSize: Constant.mediumTextSize,
                    ),
                  ),
                ),
                Container(
                  height: 40.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Constant.lightBlue),
                  child: Text(
                    'Đã đạt',
                    style: GoogleFonts.sourceSans3(
                      fontWeight: FontWeight.bold,
                      color: Constant.white,
                      fontSize: Constant.mediumTextSize,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
