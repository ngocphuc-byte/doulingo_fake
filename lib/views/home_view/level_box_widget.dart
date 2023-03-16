import 'package:doulingo_fake/helper/route.dart';
import 'package:doulingo_fake/models/level_model.dart';
import 'package:doulingo_fake/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/constant.dart';

class LevelBoxWidget extends StatelessWidget {
  LevelBoxWidget({
    super.key,
    required this.index,
    required this.levelModel,
    required this.userModel,
    required this.check,
    required this.indexNext,
  });
  int index;
  LevelModel? levelModel;
  UserModel? userModel;
  bool check;
  int indexNext;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (check) {
          print('đã vượt');
        } else if(index == indexNext){
          print("Let's go");
        } else {
          print('chưa qua bài trước');
        }
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
            color: check
                ? Constant.green
                : index == indexNext
                    ? Constant.red
                    : Constant.grey,
            borderRadius: BorderRadius.circular(50.sp),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                color: check
                    ? Constant.subGreen
                    : index == indexNext
                        ? Constant.subRed
                        : Constant.subGrey,
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
