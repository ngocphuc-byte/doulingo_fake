import 'package:doulingo_fake/controllers/bottom_controller.dart';
import 'package:doulingo_fake/controllers/box_controller.dart';
import 'package:doulingo_fake/controllers/information_controller.dart';
import 'package:doulingo_fake/controllers/instruction_controller.dart';
import 'package:doulingo_fake/controllers/login_controller.dart';
import 'package:doulingo_fake/controllers/room_controller.dart';
import 'package:get/get.dart';

class Dependencies extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => BottomController());
    Get.lazyPut(() => RoomController());
    Get.lazyPut(() => BoxController());
    Get.lazyPut(() => InstructionController());
    Get.lazyPut(() => InformationController());
  }
}
