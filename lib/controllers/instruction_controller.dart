import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class InstructionController extends GetxController {
  RxInt indexPage = 0.obs;
  void followIndexPage(int value) {
    indexPage.value = value;
    print(indexPage);
  }
}
