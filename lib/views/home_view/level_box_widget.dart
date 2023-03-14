import 'package:doulingo_fake/helper/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/constant.dart';

class LevelBoxWidget extends StatelessWidget {
  LevelBoxWidget({super.key, required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutePage.roomPage);
      },
      child: Container(
        alignment: Alignment.center,
        child: Container(
          margin: (index % 2 != 0 && index <= 5)
              ? EdgeInsets.only(right: 200.sp)
              : (index % 2 != 0 && index > 5)
                  ? EdgeInsets.only(left: 200.sp)
                  : null,
          height: 80.h,
          width: 80.w,
          decoration: BoxDecoration(
            color: index < 2 ? Constant.green : Constant.grey,
            borderRadius: BorderRadius.circular(50.sp),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                color: index < 2 ? Constant.subGreen : Constant.subGrey,
                spreadRadius: 2,
                blurRadius: 1,
              ),
            ],
          ),
          child: Icon(
            Icons.star,
            size: 50.sp,
            color: Constant.white,
          ),
        ),
      ),
    );
  }
}
