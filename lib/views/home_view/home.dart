import 'package:doulingo_fake/controllers/bottom_controller.dart';
import 'package:doulingo_fake/helper/route.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    BottomController bottomController = Get.find();
    // late FixedExtentScrollController controller;
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          //----------------------------------------------------------------
          return index % 4 == 0
              ? Container(
                  alignment: Alignment.center,
                  child: Container(
                    // margin: EdgeInsets.only(),
                    height: 100.h,
                    width: 100.h,
                    decoration: BoxDecoration(
                      color: Constant.green,
                      borderRadius: BorderRadius.circular(50.sp),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 5),
                          color: Color.fromARGB(255, 2, 86, 5),
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
                )
              //----------------------------------------------------------------
              : (index % 2 != 0 && index <= 5)
                  ? Container(
                      alignment: Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(right: 200.sp),
                        height: 100.h,
                        width: 100.h,
                        decoration: BoxDecoration(
                          color: Constant.green,
                          borderRadius: BorderRadius.circular(50.sp),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 5),
                              color: Color.fromARGB(255, 2, 86, 5),
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
                    )
              //----------------------------------------------------------------
                  : (index % 2 != 0 && index > 5)
                      ? Container(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.only(left: 200.sp),
                            height: 100.h,
                            width: 100.h,
                            decoration: BoxDecoration(
                              color: Constant.green,
                              borderRadius: BorderRadius.circular(50.sp),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 5),
                                  color: Color.fromARGB(255, 2, 86, 5),
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
                        )
              //----------------------------------------------------------------
                      : Container(
                          alignment: Alignment.center,
                          child: Container(
                            // margin: EdgeInsets.only(left: 50.sp),
                            height: 100.h,
                            width: 100.h,
                            decoration: BoxDecoration(
                              color: Constant.green,
                              borderRadius: BorderRadius.circular(50.sp),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 5),
                                  color: Color.fromARGB(255, 2, 86, 5),
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
                        );
        },
      ),
    );
  }
}
