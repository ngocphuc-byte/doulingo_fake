import 'package:doulingo_fake/controllers/bottom_controller.dart';
import 'package:doulingo_fake/controllers/login_controller.dart';
import 'package:get/get.dart';

class Dependencies extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => BottomController());
  }

}