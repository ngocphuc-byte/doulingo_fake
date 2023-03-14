import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BoxController extends GetxController {
  RxBool stateStar = true.obs;
  RxList testList = [].obs;
  @override
  void onInit() {
    super.onInit();
    testList.value = List.generate(10, (index) => index);
  }
  void changeStateStar(){
    stateStar.value = !stateStar.value;
  }
  void onDismissed(int index) {
    testList.removeAt(index);
  }
}