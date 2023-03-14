import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/room_view/button_widget.dart';
import 'package:doulingo_fake/views/room_view/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/room_controller.dart';
import 'button_next_widget.dart';

class WordPage extends StatelessWidget {
  WordPage({super.key, required this.indexPage});
  int indexPage;
  @override
  Widget build(BuildContext context) {
    RoomController roomController = Get.find();
    // double value = 0.5;
    return Container(
      height: 625.h,
      width: 350.w,
      child: Column(
        children: [
          TextTitleWidget(title: 'Chọn từ điền vào chỗ trống'),
          Container(
            width: 350.w,
            height: 150.h,
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 140.h,
                    width: 350.w,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1, color: Constant.grey),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Lottie.asset(
                            'assets/images/talking.json',
                            repeat: false,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
                          height: 120.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(
                              width: 1,
                              color: Constant.grey,
                            ),
                          ),
                          child: FittedBox(
                            child: Text(
                              'Trái táo là gì ?',
                              style: GoogleFonts.sourceSans3(
                                  color: Constant.white,
                                  fontSize: Constant.mediumTextSize),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Container(
            width: 350.w,
            height: 350.h,
            child: SizedBox(
              width: 350.w,
              height: 200.h,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 4,
                  crossAxisCount: 2,
                  mainAxisSpacing: 50.h,
                  childAspectRatio: 2.h,
                ),
                itemBuilder: (context, index) {
                  return ButtonWidget(indexPage: indexPage);
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: 350.w,
            height: 30.h,
            child: ButtonNextWidget(indexPage: indexPage),
          ),
        ],
      ),
    );
  }
}
