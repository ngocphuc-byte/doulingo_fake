import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class RoomController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  void jumpPage(index) {
    pageController.animateToPage(index,
        duration: Duration(seconds: 1), curve: Curves.easeIn);
    update();
  }

  

  
}
