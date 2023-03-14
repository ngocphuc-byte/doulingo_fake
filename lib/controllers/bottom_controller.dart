import 'dart:async';
import 'dart:math';

import 'package:doulingo_fake/helper/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class BottomController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxInt indexScroll = 0.obs;
  RxDouble valueIndicator = 0.0.obs;

  FixedExtentScrollController controller =
      FixedExtentScrollController(initialItem: 0);
  void toHeadPage() {
    controller.animateToItem(0,
        duration: Duration(seconds: 2), curve: Curves.easeInOut);
  }

  void updateIndex(int index) {
    indexScroll.value = index;
  }

  void randomIndicator()  {
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (valueIndicator < 1.0) {
          valueIndicator.value += (Random().nextInt(10).toDouble())/100;
          print(valueIndicator);
          // update();
      } else {
        Get.offNamed(RoutePage.loginPage);
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // randomIndicator();
    super.dispose();
  }
}
