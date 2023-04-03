import 'package:doulingo_fake/bloc/login/login_bloc.dart';
import 'package:doulingo_fake/controllers/information_controller.dart';
import 'package:doulingo_fake/data/provider/user_provider.dart';
import 'package:doulingo_fake/models/user_model.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderInformation extends StatelessWidget {
  const HeaderInformation({super.key});

  @override
  Widget build(BuildContext context) {
    InformationController informationController = Get.put(InformationController());
    late UserModel userModel;
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginLoaded) {
          userModel = state.userModel;
        } else {
          print('Somethings Wrong');
        }
        return Container(
          margin: EdgeInsets.only(bottom: 5.sp),
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${userModel.username}',
                      style: GoogleFonts.sourceSans3(
                          fontSize: Constant.mediumTextSize,
                          color: Constant.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${userModel.email}',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.sourceSans3(
                        fontSize: Constant.smallTextSize,
                        color: Constant.white,
                      ),
                    ),
                    Text(
                      'Đã tham gia vào: ${userModel.createdAt?.substring(0, 10).replaceAll(RegExp(r'-'), '/')}',
                      style: GoogleFonts.sourceSans3(
                        fontSize: Constant.smallTextSize,
                        color: Constant.white,
                      ),
                    ),
                    Image.asset(
                      'assets/images/america_icon.png',
                      fit: BoxFit.fitWidth,
                      width: 30.w,
                      height: 30.h,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  informationController.showModelBottom(context);
                },
                child: CircleAvatar(
                  radius: 35.sp,
                  backgroundImage: NetworkImage('${userModel.image}'),
                  child: Opacity(opacity: 0.7, child: Icon(Icons.edit)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
