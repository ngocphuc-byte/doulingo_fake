import 'package:doulingo_fake/bloc/blog/blog_bloc.dart';
import 'package:doulingo_fake/data/provider/blog_provider.dart';
import 'package:doulingo_fake/models/blog_model.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/notification_view/text_field_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FormPage extends StatelessWidget {
  FormPage({super.key, this.blogModel});
  BlogModel? blogModel;

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
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          label: Text(
                            'Chủ đề:',
                            style:
                                GoogleFonts.sourceSans3(color: Constant.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Constant.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Constant.grey))),
                    ),
                    SizedBox(height: 10.h),
                    TextField(
                      controller: snippetController,
                      decoration: InputDecoration(
                          label: Text(
                            'Mô tả:',
                            style:
                                GoogleFonts.sourceSans3(color: Constant.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Constant.grey)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Constant.grey))),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 100.h,
                      child: TextField(
                        controller: bodyController,
                        decoration: InputDecoration(
                            label: Text(
                              'Nội dung:',
                              style: GoogleFonts.sourceSans3(
                                  color: Constant.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Constant.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Constant.grey))),
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
                Container(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      blogModel != null
                          ? context.read<BlogBloc>().add(UpdateBlog(
                                  blogModel: BlogModel(
                                id: blogModel!.id,
                                title: titleController.text,
                                snippet: snippetController.text,
                                body: bodyController.text,
                              )))
                          : context.read<BlogBloc>().add(
                                CreateBlog(
                                  blogModel: BlogModel(
                                      title: titleController.text,
                                      snippet: snippetController.text,
                                      body: bodyController.text),
                                ),
                              );
                    },
                    icon:
                        Icon(blogModel != null ? Icons.edit_note : Icons.check),
                    label: Text(blogModel != null ? 'Chỉnh sửa' : 'Thêm Blog'),
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
