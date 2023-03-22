import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class RoomController extends GetxController {
  SpeechToText speechToText = SpeechToText();
  RxString text = 'Nhấn giữ để nói'.obs;
  RxBool isListenning = false.obs;
  RxInt count = 0.obs;
  RxDouble page = 0.1.obs;

  void onTapDown() async {
    if (!isListenning.value) {
      var available = await speechToText.initialize();
      if (available) {
        isListenning.value = true;
        speechToText.listen(
          onResult: (result) {
            text.value = result.recognizedWords;
          },
        );
      }
    }
  }

  void onTapUp() async {
    isListenning.value = false;
    speechToText.stop();
  }

  PageController pageController = PageController(initialPage: 0);
  void jumpPage(index) {
    pageController.animateToPage(index,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
    update();
  }

  void backPage() {
    pageController = PageController(initialPage: 0);
    text.value = 'Nhấn giữ để nói';
    page.value = 0.1;
    Get.back();
  }
}
