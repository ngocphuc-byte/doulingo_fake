import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constant.dart';

class BoxInformation extends StatelessWidget {
  const BoxInformation(
      {super.key, this.title, this.iconBox, this.content, this.colorIcon});
  final String? title;
  final IconData? iconBox;
  final Color? colorIcon;
  final String? content;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 50.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Constant.mainColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 3),
            color: Colors.blueGrey,
            spreadRadius: 0,
          ),
          BoxShadow(
            offset: Offset(3, 0),
            color: Colors.blueGrey,
            spreadRadius: 1,
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            color: Colors.blueGrey,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10.sp),
            child: Icon(
              iconBox,
              color: colorIcon,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${content}',
                style: GoogleFonts.sanchez(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Constant.white),
              ),
              Text(
                '${title}',
                style:
                    GoogleFonts.sanchez(fontSize: 14.sp, color: Constant.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
