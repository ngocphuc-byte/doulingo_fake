import 'package:doulingo_fake/bloc/blog/blog_bloc.dart';
import 'package:doulingo_fake/data/provider/blog_provider.dart';
import 'package:doulingo_fake/helper/route.dart';
import 'package:doulingo_fake/models/blog_model.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/notification_view/card_notification.dart';
import 'package:doulingo_fake/views/notification_view/text_field_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Bảng tin',
                    style: GoogleFonts.sourceSans3(
                        fontSize: Constant.mediumTextSize,
                        color: Constant.grey,
                        fontWeight: Constant.boldWeight)),
                IconButton(
                  onPressed: () {
                    Get.toNamed(RoutePage.formPage);
                  },
                  icon: Icon(
                    Icons.add,
                    color: Constant.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
            height: 470.h,
            alignment: Alignment.center,
            margin: MediaQuery.of(context).viewInsets,
            child: BlocBuilder<BlogBloc, BlogState>(
              builder: (context, state) {
                if (state is BlogLoading || state is BlogInitial) {
                  context.read<BlogBloc>().add(GetBlog());
                  return CircularProgressIndicator();
                } else if (state is BlogLoaded) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<BlogBloc>().add(GetBlog());
                    },
                    child: ListView.separated(
                      itemCount: state.blogList.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        BlogModel blogModel = state.blogList[index];
                        return CardNotification(
                          blogModel: blogModel,
                        );
                      },
                    ),
                  );
                }
                return SizedBox();
              },
            )),
      ],
    );
  }
}
