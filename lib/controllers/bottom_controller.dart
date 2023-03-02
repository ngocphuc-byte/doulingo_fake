import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxInt indexScroll = 0.obs;

  FixedExtentScrollController controller =
      FixedExtentScrollController(initialItem: 0);
  void toHeadPage() {
    controller.animateToItem(0,
        duration: Duration(seconds: 2), curve: Curves.easeInOut);
  }

  void updateIndex(int index) {
    indexScroll.value = index;
  }
}
