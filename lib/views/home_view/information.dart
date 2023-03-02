import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/widgets/box_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
              preferredSize: Size.fromHeight(150.h),
              child: Container(
                margin: EdgeInsets.only(bottom: 5.sp),
                alignment: Alignment.center,
                padding: EdgeInsets.all(
                  10.sp,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phúc',
                            style: GoogleFonts.roboto(
                                fontSize: 20.sp,
                                color: Constant.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'ngocphuc00001@gmail.com',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.sanchez(
                              fontSize: 14.sp,
                              color: Constant.white,
                            ),
                          ),
                          Text(
                            'Đã tham gia vào 10/02/2023',
                            style: GoogleFonts.sanchez(
                              fontSize: 14.sp,
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
                    CircleAvatar(
                      radius: 35.sp,
                      backgroundImage: const NetworkImage(
                          'https://images2.thanhnien.vn/Uploaded/tuyenth/2022_11_02/a5-5205.png'),
                    ),
                  ],
                ),
                // Text(
                //   'Profile',
                //   style: GoogleFonts.roboto(
                //     color: Constant.lightBlue,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 22.sp,
                //   ),
                // ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 10.h),
              child: Column(
                children: [
                  Container(
                    height: 60.h,
                    margin: EdgeInsets.only(top: 8.h),
                    padding:
                        EdgeInsets.only(left: 10.w, right: 10.w, bottom: 15.h),
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
                        Container(
                          width: 250.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Constant.mainColor,
                            borderRadius: BorderRadius.circular(12.sp),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.edit,
                                color: Constant.lightBlue,
                                size: 24.sp,
                              ),
                              Text(
                                'Chỉnh sửa thông tin',
                                style: GoogleFonts.roboto(
                                  fontSize: 18.sp,
                                  color: Constant.lightBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 50.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Constant.mainColor,
                            borderRadius: BorderRadius.circular(12.sp),
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
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 200.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10.w, left: 10.w),
                          alignment: Alignment.centerLeft,
                          height: 50.h,
                          child: Text(
                            'Thống kê',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              color: Constant.white,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.w, left: 10.w),
                          child: SizedBox(
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
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10.w, left: 10.w),
                          child: Container(
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
                        borderRadius: BorderRadius.circular(14.sp),
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
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 80.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 80.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        16.sp),
                                                child: Image.network(
                                                    'https://wallpapercave.com/dwp1x/wp4278771.png'),
                                              ),
                                            ),
                                            Container(
                                              width: 200.w,
                                              alignment: Alignment.centerLeft,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      'Học giả',
                                                      style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Constant.white,
                                                        fontSize: 20.sp,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 50.h,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    16.sp),
                                                        color:
                                                            Constant.lightBlue),
                                                    child: Text(
                                                      'Đã đạt',
                                                      style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Constant.white,
                                                        fontSize: 20.sp,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
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
                                bottomLeft: Radius.circular(14.sp),
                                bottomRight: Radius.circular(14.sp)),
                            child: Container(
                              margin: EdgeInsets.only(top: 6.h),
                              alignment: Alignment.center,
                              height: 50.h,
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
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
    );
  }
}
