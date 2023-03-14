import 'package:doulingo_fake/controllers/box_controller.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/box_view/card_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxPage extends StatelessWidget {
  const BoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    BoxController boxController = Get.find();
    return Obx(
      () {
        List item = boxController.testList.value;
        return Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: item.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey<int>(item[index]),
                onDismissed: (direction) {
                  boxController.onDismissed(index);
                },
                child: CardItemWidget(),
              );
            },
          ),
        );
      },
    );
  }
}
