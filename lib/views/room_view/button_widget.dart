import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key, required this.indexPage});
  int indexPage;
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
          textToSpeech.speak('Apple');
        },
        child: Text(
          'Apple $indexPage',
          style: GoogleFonts.lato(
            color: Constant.white,
            fontSize: Constant.smallTextSize,
            fontWeight: Constant.boldWeight,
          ),
        ),
      ),
    );
  }
}
