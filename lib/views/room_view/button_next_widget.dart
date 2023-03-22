import 'package:doulingo_fake/bloc/login/login_bloc.dart';
import 'package:doulingo_fake/bloc/package/package_bloc.dart';
import 'package:doulingo_fake/bloc/question/question_bloc.dart';
import 'package:doulingo_fake/controllers/room_controller.dart';
import 'package:doulingo_fake/models/question_model.dart';
import 'package:doulingo_fake/models/user_model.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonNextWidget extends StatelessWidget {
  ButtonNextWidget(
      {super.key,
      required this.indexPage,
      required this.questionModel,
      required this.id_Level});
  int indexPage;
  QuestionModel questionModel;
  String id_Level;
  late UserModel userModel;
  @override
  Widget build(BuildContext context) {
    RoomController roomController = Get.find();
    void notificate(BuildContext context, bool result) {
      showModalBottomSheet(
        isDismissible: false,
        enableDrag: false,
        backgroundColor: Constant.subColor,
        context: context,
        builder: (context) {
          return BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoaded) {
                userModel = state.userModel;
              }
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
                                  backgroundColor:
                                      result ? Constant.green : Constant.red,
                                  child: Icon(Icons.check, color: Colors.black),
                                  radius: 12.sp,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  result ? 'Tuyệt vời!' : 'Oh no bạn sai rồi!',
                                  style: GoogleFonts.sourceSansPro(
                                      color: result
                                          ? Constant.green
                                          : Constant.red,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 3.h),
                        child: Text(
                          result ? 'Bạn thật là giỏi' : 'Thật tiếc',
                          style: GoogleFonts.sourceSansPro(
                              color: result ? Constant.green : Constant.red,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        result
                            ? 'Cứ thế mà phát huy nhé'
                            : 'Cố gắng lần sau nhé',
                        style: GoogleFonts.sourceSansPro(
                          color: result ? Constant.green : Constant.red,
                          fontSize: 16.sp,
                        ),
                      ),
                      indexPage == 8
                          ? BlocBuilder<PackageBloc, PackageState>(
                              builder: (context, state) {
                                return BlocBuilder<QuestionBloc, QuestionState>(
                                  builder: (context, state) {
                                    return Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(300.w, 30.h),
                                          backgroundColor: result
                                              ? Constant.green
                                              : Constant.red,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.sp),
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.back();
                                          context
                                              .read<QuestionBloc>()
                                              .add(OutScreenQuestion());
                                          roomController.page.value = 0.1;

                                          Get.back();

                                          if (roomController.count.value == 9) {
                                            context.read<PackageBloc>().add(
                                                UpdatePackage(
                                                    id_Level: id_Level,
                                                    id_User: userModel.id
                                                        .toString()));
                                            context
                                                .read<PackageBloc>()
                                                .add(GetPackage());
                                            roomController.count.value = 0;
                                            roomController.text.value =
                                                'Nhấn giữ để nói';
                                          }
                                        },
                                        child: Text(
                                          'Tiếp tục',
                                          style: GoogleFonts.roboto(
                                            fontSize: 16.sp,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            )
                          : Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(300.w, 30.h),
                                  backgroundColor:
                                      result ? Constant.green : Constant.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.sp),
                                  ),
                                ),
                                onPressed: () {
                                  Get.back();
                                  roomController.jumpPage(indexPage + 1);
                                  roomController.page.value += 0.1;
                                  roomController.text.value = 'Nhấn giữ để nói';
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
      );
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(300.w, 30.h),
        backgroundColor: Constant.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.sp),
        ),
      ),
      onPressed: () {
        if (questionModel.question == roomController.text.value) {
          roomController.count.value += 1;
          notificate(context, true);
        } else {
          notificate(context, false);
        }
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
