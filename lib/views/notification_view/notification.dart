import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/notification_view/card_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 40.h,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 3.sp,
                color: Constant.grey,
              ),
            ),
          ),
          child: Text('Bảng tin',
              style: GoogleFonts.sourceSans3(
                  fontSize: Constant.mediumTextSize,
                  color: Constant.grey,
                  fontWeight: Constant.boldWeight)),
        ),
        Container(
          height: 470.h,
          child: ListView.separated(
            itemCount: 10,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return index == 0
                  ? Image.asset(
                      'assets/images/background_follow.jpg',
                      fit: BoxFit.cover,
                    )
                  : const CardNotification();
            },
          ),
        ),
      ],
    );
  }
}
