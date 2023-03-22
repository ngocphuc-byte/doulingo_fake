import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CardItemWidget extends StatelessWidget {
  CardItemWidget({super.key, required this.item});
  var item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Card(
        borderOnForeground: true,
        color: Constant.subColor,
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          width: 350.w,
          height: 70.h,
          color: Constant.white.withOpacity(0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${item['option']}',
                    style: GoogleFonts.lato(
                        fontSize: Constant.mediumTextSize,
                        color: Constant.white,
                        fontWeight: Constant.midWeight),
                  ),
                  Text(
                    '${item['question']}',
                    style: GoogleFonts.lato(
                      fontSize: Constant.smallTextSize,
                      color: Constant.white,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.star,
                  color: Constant.yellow,
                  size: 28.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
