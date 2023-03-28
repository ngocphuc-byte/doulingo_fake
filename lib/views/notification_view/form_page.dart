import 'package:doulingo_fake/bloc/blog/blog_bloc.dart';
import 'package:doulingo_fake/data/provider/blog_provider.dart';
import 'package:doulingo_fake/models/blog_model.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/notification_view/text_field_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormPage extends StatelessWidget {
  FormPage({super.key});
  TextEditingController titleController = TextEditingController();
  TextEditingController snippetController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.mainColor,
      body: BlocListener<BlogBloc, BlogState>(
        listener: (context, state) {
          if (state is BlogSuccess) {
            context.read<BlogBloc>().add(GetBlog());
            Get.back();
          }
        },
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close, color: Constant.white),
                  ),
                ),
                Column(
                  children: [
                    TextFieldNotification(
                      label: 'Chủ đề:',
                      textController: titleController,
                      isBool: false,
                    ),
                    SizedBox(height: 10.h),
                    TextFieldNotification(
                      label: 'Mô tả:',
                      textController: snippetController,
                      isBool: false,
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                        height: 100.h,
                        child: TextFieldNotification(
                          label: 'Nội dung:',
                          textController: bodyController,
                          isBool: true,
                        )),
                    SizedBox(height: 10.h),
                  ],
                ),
                Container(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<BlogBloc>().add(
                            CreateBlog(
                              blogModel: BlogModel(
                                  title: titleController.text,
                                  snippet: snippetController.text,
                                  body: bodyController.text),
                            ),
                          );
                    },
                    icon: const Icon(Icons.check),
                    label: const Text('Thêm Blog'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
