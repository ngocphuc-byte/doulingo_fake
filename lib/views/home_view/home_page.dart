import 'package:doulingo_fake/controllers/bottom_controller.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/home_view/bottom_tab.dart';
import 'package:doulingo_fake/views/home_view/box.dart';
import 'package:doulingo_fake/views/home_view/information.dart';
import 'package:doulingo_fake/views/home_view/notification.dart';
import 'package:doulingo_fake/views/home_view/setting.dart';
import 'package:doulingo_fake/views/home_view/top_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BottomController _bottomController = Get.find();
    return Scaffold(
      backgroundColor: Constant.mainColor,
      body: Container(
        child: Obx(
          () => Column(
            children: [
              TabBarWidget(),
              if (_bottomController.currentIndex.value == 0) Home(),
              if (_bottomController.currentIndex.value == 1) BoxPage(),
              if (_bottomController.currentIndex.value == 2) InformationPage(),
              if (_bottomController.currentIndex.value == 3) NotificationPage(),
              if (_bottomController.currentIndex.value == 4) SettingPage(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomTabWidget(),
    );
  }
}
