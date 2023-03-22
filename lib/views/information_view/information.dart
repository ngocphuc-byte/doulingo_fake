import 'package:doulingo_fake/bloc/login/login_bloc.dart';
import 'package:doulingo_fake/helper/route.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/information_view/achievement._widget.dart';
import 'package:doulingo_fake/views/information_view/header_information.dart';
import 'package:doulingo_fake/widgets/box_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

class InformationPage extends StatelessWidget {
  InformationPage({super.key});

  final loginBox = Hive.box('login');

  Future<void> _onDeleteUSer() async {
    await loginBox.deleteAt(0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginOut) {
          Get.offAndToNamed(RoutePage.loginPage);
        }
      },
      child: Expanded(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Constant.mainColor,
              expandedHeight: 100.h,
              floating: true,
              pinned: true,
              // stretch: true,
              toolbarHeight: 100.h,
              elevation: 20,
              // snap: true,
              // flexibleSpace: FlexibleSpaceBar(

              // ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(125.h),
                child: const HeaderInformation(),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(top: 10.h),
                child: Column(
                  children: [
                    BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return Container(
                          height: 60.h,
                          margin: EdgeInsets.only(top: 8.h),
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, bottom: 15.h),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: Constant.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print('hehe');
                                },
                                child: Container(
                                  width: 250.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Constant.mainColor,
                                    borderRadius: BorderRadius.circular(10.sp),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 3),
                                        color: Colors.blueGrey,
                                        spreadRadius: 1,
                                      ),
                                      BoxShadow(
                                        offset: Offset(3, 0),
                                        color: Colors.blueGrey,
                                        spreadRadius: 1,
                                      ),
                                      BoxShadow(
                                        offset: Offset(-3, 0),
                                        color: Colors.blueGrey,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        color: Constant.lightBlue,
                                        size: 24.sp,
                                      ),
                                      Text(
                                        'Chỉnh sửa thông tin',
                                        style: GoogleFonts.sourceSans3(
                                          fontSize: Constant.mediumTextSize,
                                          color: Constant.lightBlue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.read<LoginBloc>().add(SignOut());
                                },
                                child: Container(
                                  width: 50.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Constant.mainColor,
                                    borderRadius: BorderRadius.circular(10.sp),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 3),
                                        color: Colors.blueGrey,
                                        spreadRadius: 1,
                                      ),
                                      BoxShadow(
                                        offset: Offset(3, 0),
                                        color: Colors.blueGrey,
                                        spreadRadius: 1,
                                      ),
                                      BoxShadow(
                                        offset: Offset(-3, 0),
                                        color: Colors.blueGrey,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.logout,
                                    color: Constant.lightBlue,
                                    size: 24.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 170.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 10.w, left: 10.w),
                            alignment: Alignment.bottomLeft,
                            height: 40.h,
                            child: Text(
                              'Thống kê',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                color: Constant.white,
                                fontSize: 20.sp,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10.w, left: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BoxInformation(
                                    iconBox: Icons.electric_bike,
                                    title: 'Ngày streak',
                                    content: '0',
                                    colorIcon: Constant.lightBlue),
                                BoxInformation(
                                  iconBox: Icons.electric_bike,
                                  title: 'Tổng số level',
                                  content: '0',
                                  colorIcon: Constant.yellow,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 10.w, left: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BoxInformation(
                                  iconBox: Icons.electric_bike,
                                  title: 'Ngày streak',
                                  content: '0',
                                  colorIcon: Constant.green,
                                ),
                                BoxInformation(
                                  iconBox: Icons.electric_bike,
                                  title: 'Ngày streak',
                                  content: '0',
                                  colorIcon: Constant.purple,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      alignment: Alignment.centerLeft,
                      height: 50.h,
                      child: Text(
                        'Thành tích',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          color: Constant.white,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: Container(
                        height: 360.h,
                        width: 350.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          border: Border.all(
                            width: 2,
                            color: Constant.grey,
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                  left: 10.w,
                                  right: 10.w,
                                ),
                                child: Container(
                                  height: 300.h,
                                  alignment: Alignment.topCenter,
                                  child: ListView.separated(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return const AchievementWidget();
                                      },
                                      separatorBuilder: (context, index) =>
                                          Divider(
                                            color: Constant.grey,
                                          ),
                                      itemCount: 3),
                                )),
                            InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.sp),
                                  bottomRight: Radius.circular(10.sp)),
                              child: Container(
                                margin: EdgeInsets.only(top: 6.h),
                                alignment: Alignment.center,
                                height: 50.h,
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      width: 1,
                                      color: Constant.grey,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Những thành tích khác',
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                        color: Constant.white,
                                      ),
                                    ),
                                    Icon(
                                      Icons.double_arrow_rounded,
                                      color: Constant.white,
                                      size: 24.sp,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
