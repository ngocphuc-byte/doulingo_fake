import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:doulingo_fake/bloc/login/login_bloc.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class InformationController extends GetxController {
  final cloudinary = CloudinaryPublic('phucdeptrai', 'phucdeptrai');
  void showModelBottom(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 100.h,
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          color: Constant.mainColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  openGallery(context);
                },
                child: Container(
                  height: 45.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.collections,
                        color: Constant.white,
                      ),
                      Text(
                        'Mở thư viện ảnh',
                        style: GoogleFonts.sourceSans3(
                            color: Constant.white,
                            fontWeight: Constant.boldWeight,
                            fontSize: Constant.smallTextSize),
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: Constant.grey, height: 1, thickness: 2),
              InkWell(
                onTap: () {
                  openCamera(context);
                },
                child: Container(
                  height: 45.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.photo_camera,
                        color: Constant.white,
                      ),
                      Text(
                        'Mở Camera',
                        style: GoogleFonts.sourceSans3(
                            color: Constant.white,
                            fontWeight: Constant.boldWeight,
                            fontSize: Constant.smallTextSize),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future openGallery(BuildContext context) async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(img!.path,
              resourceType: CloudinaryResourceType.Image));
      print(response.secureUrl);
      context.read<LoginBloc>().add(UpdateImage(image: response.secureUrl));
    } catch (e) {
      print(e);
    }
  }

  Future openCamera(BuildContext context) async {
    var img = await ImagePicker().pickImage(source: ImageSource.camera);
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(img!.path,
              resourceType: CloudinaryResourceType.Image));
      print(response.secureUrl);
      context.read<LoginBloc>().add(UpdateImage(image: response.secureUrl));
    } catch (e) {
      print(e);
    }
  }
}
