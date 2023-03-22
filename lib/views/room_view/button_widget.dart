import 'package:doulingo_fake/bloc/login/login_bloc.dart';
import 'package:doulingo_fake/bloc/package/package_bloc.dart';
import 'package:doulingo_fake/bloc/question/question_bloc.dart';
import 'package:doulingo_fake/bloc/vocabulary/vocabulary_bloc.dart';
import 'package:doulingo_fake/controllers/room_controller.dart';
import 'package:doulingo_fake/models/question_model.dart';
import 'package:doulingo_fake/models/user_model.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hive_flutter/adapters.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {super.key,
      required this.indexPage,
      required this.optionModel,
      required this.id_Level,
      required this.optionTrue,
      required this.type,
      required this.question});
  int indexPage;
  OptionModel optionModel;
  String id_Level;
  OptionModel optionTrue;
  String type, question;
  RoomController roomController = Get.find();

  final vocabularyBox = Hive.box('vocabulary');

  void _onHandleAddVocabulary(Map<String, dynamic> data) async {
    await vocabularyBox.add(data);
    print(vocabularyBox.length);
  }

  @override
  Widget build(BuildContext context) {
    FlutterTts textToSpeech = FlutterTts();
    textToSpeech.setLanguage('en-US');
    void setTTS() async {
      await textToSpeech.setSpeechRate(0.5);
      // await textToSpeech.setVoice({"name": "es-es-x-lac#male_1-local"});
    }

    setTTS();
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Constant.mainColor,
            minimumSize: Size(120.w, 120.h),
            maximumSize: Size(120.w, 120.h),
            elevation: 8.sp,
            side:
                BorderSide(width: 2.w, color: Constant.grey.withOpacity(0.5))),
        onPressed: () async {
          textToSpeech.speak('${optionModel.option}');
          notificate(context, optionModel);
          if (optionModel.result == true) {
            roomController.count.value += 1;
          }
        },
        child: FittedBox(
          child: Text(
            '${optionModel.option}',
            style: GoogleFonts.lato(
              color: Constant.white,
              fontSize: Constant.smallTextSize,
              fontWeight: Constant.boldWeight,
            ),
          ),
        ),
      ),
    );
  }

  void notificate(BuildContext context, OptionModel optionModel) {
    RoomController roomController = Get.find();
    late UserModel userModel;
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
            } else {
              print('no data');
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
                              backgroundColor: optionModel.result as bool
                                  ? Constant.green
                                  : Constant.red,
                              radius: 12.sp,
                              child: Icon(
                                  optionModel.result as bool
                                      ? Icons.check
                                      : Icons.close,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            FittedBox(
                              child: Text(
                                optionModel.result as bool
                                    ? 'Tuyệt vời!'
                                    : 'Sai rồi!',
                                style: GoogleFonts.sourceSansPro(
                                    color: optionModel.result as bool
                                        ? Constant.green
                                        : Constant.red,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        type == 'Writting'
                            ? Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      context.read<VocabularyBloc>().add(
                                            AddVocabulary(
                                              question: question,
                                              option:
                                                  optionTrue.option.toString(),
                                            ),
                                          );
                                    },
                                    icon: Icon(
                                      Icons.emoji_flags,
                                      color: optionModel.result as bool
                                          ? Constant.green
                                          : Constant.red,
                                      size: 24.sp,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.chat,
                                      color: optionModel.result as bool
                                          ? Constant.green
                                          : Constant.red,
                                      size: 24.sp,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3.h),
                    child: Text(
                      optionModel.result as bool
                          ? 'Chúc mừng bạn nhé'
                          : 'Cố lên bạn nhé:',
                      style: GoogleFonts.sourceSansPro(
                          color: optionModel.result as bool
                              ? Constant.green
                              : Constant.red,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    optionModel.result as bool
                        ? 'Có cố gắng đấy hehe'
                        : 'Đáp án đúng : ${optionTrue.option}',
                    style: GoogleFonts.sourceSansPro(
                      color: optionModel.result as bool
                          ? Constant.green
                          : Constant.red,
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
                                      backgroundColor:
                                          optionModel.result as bool
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
                                                id_User:
                                                    userModel.id.toString()));
                                        context
                                            .read<PackageBloc>()
                                            .add(GetPackage());
                                      }
                                      roomController.count.value = 0;
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
                              backgroundColor: optionModel.result as bool
                                  ? Constant.green
                                  : Constant.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                              roomController.jumpPage(indexPage + 1);
                              roomController.page.value += 0.1;
                              //here
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
              ),
            );
          },
        );
      },
    );
  }
}
