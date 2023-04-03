import 'package:doulingo_fake/bloc/blog/blog_bloc.dart';
import 'package:doulingo_fake/helper/route.dart';
import 'package:doulingo_fake/models/blog_model.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class CardNotification extends StatelessWidget {
  CardNotification({super.key, required this.blogModel});
  BlogModel blogModel;
  var user = Hive.box('login');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.sp),
            color: Constant.mainColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                color: Constant.grey,
                spreadRadius: 2,
              )
            ]),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.sp),
                  topRight: Radius.circular(16.sp),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      'https://wallpapercave.com/dwp1x/wp4278731.jpg',
                      fit: BoxFit.cover,
                      width: 350.w,
                      height: 100.h,
                    ),
                    user.getAt(0)['username'] == blogModel.userModel?.username
                        ? Positioned(
                            bottom: 0,
                            right: 0,
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Get.toNamed(RoutePage.formPage,
                                        arguments: blogModel);
                                  },
                                  icon: Icon(Icons.edit_document,
                                      color: Constant.white),
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.read<BlogBloc>().add(RemoveBlog(
                                        id: blogModel.id.toString()));
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Constant.red,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                  ],
                )),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${blogModel.createdAt?.substring(0, 10)}',
                    style: GoogleFonts.lato(
                      color: Constant.grey,
                      fontSize: Constant.smallTextSize,
                    ),
                  ),
                  Text(
                    'Tác giả: ${blogModel.userModel?.username}',
                    style: GoogleFonts.lato(
                      color: Constant.grey,
                      fontSize: Constant.smallTextSize,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.sp),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chủ đề: ${blogModel.title}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                      fontSize: Constant.smallTextSize,
                      color: Constant.white,
                      fontWeight: Constant.midWeight,
                    ),
                  ),
                  Text(
                    'Mô tả: ${blogModel.snippet}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                      fontSize: Constant.smallTextSize,
                      color: Constant.white,
                      fontWeight: Constant.midWeight,
                    ),
                  ),
                  Text(
                    'Nội dung: ${blogModel.body}',
                    style: GoogleFonts.lato(
                      fontSize: Constant.smallTextSize,
                      color: Constant.white,
                      fontWeight: Constant.midWeight,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
