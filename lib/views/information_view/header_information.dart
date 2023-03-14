import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderInformation extends StatelessWidget {
  const HeaderInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.sp),
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Phúc',
                  style: GoogleFonts.sourceSans3(
                      fontSize: Constant.mediumTextSize,
                      color: Constant.white,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'ngocphuc00001@gmail.com',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.sourceSans3(
                    fontSize: Constant.smallTextSize,
                    color: Constant.white,
                  ),
                ),
                Text(
                  'Đã tham gia vào 10/02/2023',
                  style: GoogleFonts.sourceSans3(
                     fontSize: Constant.smallTextSize,
                    color: Constant.white,
                  ),
                ),
                Image.asset(
                  'assets/images/america_icon.png',
                  fit: BoxFit.fitWidth,
                  width: 30.w,
                  height: 30.h,
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 35.sp,
            backgroundImage: const NetworkImage(
                'https://images2.thanhnien.vn/Uploaded/tuyenth/2022_11_02/a5-5205.png'),
          ),
        ],
      ),
    );
  }
}
