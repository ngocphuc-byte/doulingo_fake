import 'package:doulingo_fake/controllers/login_controller.dart';
import 'package:get/get.dart';

class Dependencies extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }

}