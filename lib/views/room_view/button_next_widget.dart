import 'package:doulingo_fake/controllers/room_controller.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonNextWidget extends StatelessWidget {
  ButtonNextWidget({super.key, required this.indexPage});
  int indexPage;
  @override
  Widget build(BuildContext context) {
    RoomController roomController = Get.find();
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(300.w, 30.h),
        backgroundColor: Constant.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.sp),
        ),
      ),
      onPressed: () {
        // roomController.jumpPage(indexPage + 1);
        showModalBottomSheet(
          isDismissible: false,
          enableDrag: false,
          backgroundColor: Constant.subColor,
          context: context,
          builder: (context) {
            return Container(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                height: 150.h,
                width: 350.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Constant.green,
                                child: Icon(Icons.check, color: Colors.black),
                                radius: 12.sp,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                'Tuyệt vời!',
                                style: GoogleFonts.sourceSansPro(
                                    color: Constant.green,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.emoji_flags,
                                  color: Constant.green,
                                  size: 24.sp,
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.chat,
                                  color: Constant.green,
                                  size: 24.sp,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3.h),
                      child: Text(
                        'Nghĩa là:',
                        style: GoogleFonts.sourceSansPro(
                            color: Constant.green,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Không sao đâu ku',
                      style: GoogleFonts.sourceSansPro(
                        color: Constant.green,
                        fontSize: 16.sp,
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(300.w, 30.h),
                          backgroundColor: Constant.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.sp),
                          ),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Tiếp tục',
                          style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          },
        );
      },
      child: Text(
        'Tiếp tục',
        style: GoogleFonts.sourceSans3(
          fontSize: Constant.mediumTextSize,
        ),
      ),
    );
  }
}
