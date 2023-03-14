import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CardNotification extends StatelessWidget {
  const CardNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.sp),
            color: Constant.mainColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                color: Constant.grey,
                spreadRadius: 2,
              )
            ]),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.sp),
                topRight: Radius.circular(16.sp),
              ),
              child: Image.network(
                'https://wallpapercave.com/dwp1x/wp4278731.jpg',
                fit: BoxFit.cover,
                width: 350.w,
                height: 100.h,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10.sp),
              child: Text(
                '2 ngày',
                style: GoogleFonts.lato(
                  color: Constant.grey,
                  fontSize: Constant.smallTextSize,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.sp),
              child: Text(
                'Mẹo: lặp đi lặp lại từng câu thật to trong bài học bạn nhé',
                style: GoogleFonts.lato(
                  fontSize: Constant.smallTextSize,
                  color: Constant.white,
                  fontWeight: Constant.midWeight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
