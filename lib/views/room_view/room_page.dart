import 'package:doulingo_fake/bloc/login/login_bloc.dart';
import 'package:doulingo_fake/bloc/question/question_bloc.dart';
import 'package:doulingo_fake/controllers/room_controller.dart';
import 'package:doulingo_fake/models/level_model.dart';
import 'package:doulingo_fake/models/question_model.dart';
import 'package:doulingo_fake/models/user_model.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/room_view/speaking_page.dart';
import 'package:doulingo_fake/views/room_view/word_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:lottie/lottie.dart';

class RoomPage extends StatelessWidget {
  RoomPage({super.key, required this.levelModel});
  LevelModel levelModel;
  @override
  Widget build(BuildContext context) {
    RoomController roomController = Get.put(RoomController());
    return BlocBuilder<QuestionBloc, QuestionState>(
      builder: (context, state) {
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
                                onPressed: () {
                                  context
                                      .read<QuestionBloc>()
                                      .add(OutScreenQuestion());
                                  roomController.backPage();
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Constant.lightBlue,
                                  size: 28.sp,
                                )),
                          ),
                          Obx(
                            () => Container(
                                height: 50.h,
                                width: 200.w,
                                padding:
                                    EdgeInsets.only(top: 10.h, bottom: 10.h),
                                child: LiquidLinearProgressIndicator(
                                  value: roomController.page.value,
                                  valueColor:
                                      AlwaysStoppedAnimation(Constant.green),
                                  backgroundColor: Colors.white,
                                  borderColor: Colors.transparent,
                                  borderWidth: 5.0,
                                  borderRadius: 14.sp,
                                  direction: Axis.horizontal,
                                  center: Text(
                                      "${(roomController.page.value * 10).round()}"),
                                )),
                          ),
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
                if (state is QuestionLoading || state is QuestionInitial)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                if (state is QuestionLoaded)
                  Expanded(
                    child: GetBuilder<RoomController>(
                      builder: (_) {
                        return PageView.builder(
                          controller: roomController.pageController,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.questionList.length,
                          itemBuilder: (context, indexPage) {
                            QuestionModel questionModel =
                                state.questionList[indexPage];
                            return questionModel.type?.typeName == 'Writting' ||
                                    questionModel.type?.typeName == 'Listenning'
                                ? WordPage(
                                    indexPage: indexPage,
                                    questionModel: questionModel,
                                    type:
                                        questionModel.type?.typeName as String,
                                    id_Level: levelModel.id.toString(),
                                  )
                                : SpeakingPage(
                                    indexPage: indexPage,
                                    questionModel: questionModel,
                                    id_Level: levelModel.id.toString(),
                                  );
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
