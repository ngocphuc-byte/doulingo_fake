import 'package:doulingo_fake/controllers/bottom_controller.dart';
import 'package:doulingo_fake/helper/route.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/home_view/level_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    BottomController bottomController = Get.find();
    // late FixedExtentScrollController controller;
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          //----------------------------------------------------------------
          return index % 4 == 0
              ? LevelBoxWidget(index: index,)
              //----------------------------------------------------------------
              : (index % 2 != 0 && index <= 5)
                  ? LevelBoxWidget(index: index,)
                  //----------------------------------------------------------------
                  : (index % 2 != 0 && index > 5)
                      ? LevelBoxWidget(index: index,)
                      //----------------------------------------------------------------
                      : LevelBoxWidget(index: index,);
        },
      ),
    );
  }
}
