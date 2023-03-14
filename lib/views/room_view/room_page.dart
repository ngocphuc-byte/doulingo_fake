import 'package:doulingo_fake/controllers/room_controller.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/room_view/speaking_page.dart';
import 'package:doulingo_fake/views/room_view/word_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:lottie/lottie.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    RoomController roomController = Get.find();
    double value = 0.5;
    return Scaffold(
      backgroundColor: Constant.mainColor,
      body: SizedBox(
        height: 700.h,
        width: 350.w,
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 15.sp, right: 15.w),
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 50.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 50.h,
                        width: 60.w,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.close,
                              color: Constant.lightBlue,
                              size: 28.sp,
                            )),
                      ),
                      Container(
                          height: 50.h,
                          width: 200.w,
                          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                          child: LiquidLinearProgressIndicator(
                            value: value,
                            valueColor: AlwaysStoppedAnimation(Constant.green),
                            backgroundColor: Colors.white,
                            borderColor: Colors.transparent,
                            borderWidth: 5.0,
                            borderRadius: 14.sp,
                            direction: Axis.horizontal,
                            center: Text("${(value * 100).toInt()}"),
                          )),
                      Container(
                        alignment: Alignment.centerRight,
                        height: 50.h,
                        width: 60.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.favorite_sharp,
                              color: Constant.red,
                              size: 20.sp,
                            ),
                            Text(
                              '5',
                              style: GoogleFonts.roboto(
                                  color: Constant.red, fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GetBuilder<RoomController>(builder: (_) {
                return PageView.builder(
                  controller: roomController.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, indexPage) {
                    return indexPage == 1
                        ? SpeakingPage(indexPage: indexPage)
                        : WordPage(indexPage: indexPage);
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
