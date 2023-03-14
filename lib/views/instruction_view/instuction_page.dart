import 'package:doulingo_fake/controllers/instruction_controller.dart';
import 'package:doulingo_fake/helper/route.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/home_view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InstructionPage extends StatelessWidget {
  const InstructionPage({super.key});
  @override
  Widget build(BuildContext context) {
    InstructionController instructionController = Get.find();
    PageController _pageController =
        PageController(initialPage: 0, viewportFraction: 1);

    var _instructionList = [
      {
        "image": 'assets/images/instruction1.json',
        "text": "Chào mừng bạn đã đến với thế giới tiếng anh của chúng tôi."
      },
      {
        "image": 'assets/images/instruction2.json',
        'text':
            'Tại đây chúng tôi sẽ giúp bạn cải thiện được trình độ tiếng anh của mình.'
      },
      {
        "image": 'assets/images/instruction3.json',
        'text':
            'Nào bây giờ chúng ta sẽ bắt đầu tham gia khoá học bạn nhé. Let\'s go.'
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            allowImplicitScrolling: false,
            pageSnapping: true,
            itemCount: _instructionList.length,
            onPageChanged: (value) =>
                instructionController.followIndexPage(value),
            itemBuilder: (context, index) {
              var item = _instructionList[index] as Map;
              return Column(
                children: [
                  Lottie.asset(item['image'],
                      width: double.maxFinite, height: 300.h),
                  SizedBox(
                    width: double.maxFinite,
                    height: 400.h,
                    child: Container(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                      decoration: BoxDecoration(
                        color: Constant.mainColor,
                        borderRadius: const BorderRadius.only(
                            // topLeft: Radius.circular(22),
                            // topRight: Radius.circular(22),
                            ),
                      ),
                      //
                      child: Text(
                        item['text'],
                        style: GoogleFonts.sourceSans3(
                            fontSize: Constant.largeTextSize,
                            fontWeight: FontWeight.bold,
                            color: Constant.white),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 40.h),
            child: SmoothPageIndicator(
                controller: _pageController, // PageController
                count: _instructionList.length,
                effect: const WormEffect(
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey), // your preferred effect
                onDotClicked: (index) {
                  _pageController.animateToPage(index,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOutQuad);
                }),
          ),
          Obx(() {
            return instructionController.indexPage == 2
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 25.h, right: 20.w),
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Get.offAndToNamed(RoutePage.homePage);
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : SizedBox();
          }),
        ],
      ),
    );
  }
}
