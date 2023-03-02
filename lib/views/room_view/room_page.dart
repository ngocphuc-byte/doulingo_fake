import 'package:doulingo_fake/controllers/room_controller.dart';
import 'package:doulingo_fake/utils/constant.dart';
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
              child: GetBuilder<RoomController>(
                builder: (_) {
                  return PageView.builder(
                    controller: roomController.pageController,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, indexPage) {
                      return Container(
                        height: 625.h,
                        width: 350.w,
                        child: Column(
                          children: [
                            Container(
                              width: 350.w,
                              height: 75.h,
                              padding: EdgeInsets.only(left: 15.w, right: 15.w),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Chọn từ điền vào chỗ trống',
                                style: GoogleFonts.roboto(
                                  fontSize: 20.sp,
                                  color: Constant.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: 350.w,
                              height: 300.h,
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
                                          bottom: BorderSide(
                                              width: 1, color: Constant.grey),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Lottie.asset(
                                              'assets/images/talking.json',
                                              repeat: false,
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.fromLTRB(
                                                10.w, 10.h, 10.w, 10.h),
                                            height: 130.h,
                                            width: 160.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16.sp),
                                              border: Border.all(
                                                width: 1,
                                                color: Constant.grey,
                                              ),
                                            ),
                                            child: Text(
                                              'Trái táo là gì ?',
                                              style: GoogleFonts.roboto(
                                                  color: Constant.white,
                                                  fontSize: 16.sp),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Container(
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            width: 1, color: Constant.grey),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            width: 1, color: Constant.grey),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // alignment: Alignment.center,
                              width: 350.w,
                              height: 200.h,
                              child: Center(
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 4,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 3,
                                  ),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      alignment: Alignment.center,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Constant.mainColor,
                                            minimumSize: Size(80.w, 40.h),
                                            maximumSize: Size(140.w, 40.h),
                                            elevation: 8.sp,
                                            side: BorderSide(
                                                width: 2,
                                                color: Constant.grey
                                                    .withOpacity(0.5))),
                                        onPressed: () {},
                                        child: Text('Apple $indexPage'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Container(
                                alignment: Alignment.center,
                                width: 350.w,
                                height: 50.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(300.w, 40.h),
                                    backgroundColor: Constant.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.sp)),
                                  ),
                                  onPressed: () {
                                    roomController.jumpPage(indexPage+1);
                                  },
                                  child: Text(
                                    'Tiếp tục',
                                    style: GoogleFonts.roboto(
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      );
                    },
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }
}
