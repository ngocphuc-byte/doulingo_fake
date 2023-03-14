import 'package:avatar_glow/avatar_glow.dart';
import 'package:doulingo_fake/controllers/room_controller.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/room_view/button_next_widget.dart';
import 'package:doulingo_fake/views/room_view/button_widget.dart';
import 'package:doulingo_fake/views/room_view/text_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeakingPage extends StatelessWidget {
  SpeakingPage({super.key, required this.indexPage});
  int indexPage;
  @override
  Widget build(BuildContext context) {
    RoomController roomController = Get.find();
    return Container(
      height: 625.h,
      width: 350.w,
      child: Column(
        children: [
          TextTitleWidget(title: 'Lặp lại những gì bạn nghe'),
          Container(
            width: 350.w,
            height: 140.h,
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
                          height: 100.h,
                          width: 160.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.sp),
                            border: Border.all(
                              width: 1,
                              color: Constant.grey,
                            ),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.campaign,
                                color: Constant.white, size: 30.sp),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          Container(
            width: 350.w,
            height: 360.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  height: 150.h,
                  alignment: Alignment.center,
                  child: Text(
                    'Nhấn vào giữ để nói',
                    style: GoogleFonts.sourceSans3(
                        color: Constant.white,
                        fontSize: Constant.mediumTextSize),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                AvatarGlow(
                  glowColor: Colors.blue,
                  endRadius: 70.0.sp,
                  duration: Duration(milliseconds: 2000),
                  repeat: false,
                  showTwoGlows: true,
                  repeatPauseDuration: Duration(milliseconds: 100),
                  child: Material(
                    // Replace this child with your own
                    elevation: 8.0,
                    shape: CircleBorder(),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: Icon(Icons.mic),
                      radius: 35.0.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 350.w,
            height: 30.h,
            child: ButtonNextWidget(indexPage: indexPage),
          ),
        ],
      ),
    );
  }
}
