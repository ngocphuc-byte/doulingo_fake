import 'package:doulingo_fake/bloc/package/package_bloc.dart';
import 'package:doulingo_fake/controllers/bottom_controller.dart';
import 'package:doulingo_fake/data/provider/package_provider.dart';
import 'package:doulingo_fake/data/repository/package_repo.dart';
import 'package:doulingo_fake/helper/route.dart';
import 'package:doulingo_fake/models/package_model.dart';
import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/home_view/level_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    PackageRepo packageRepo = PackageRepo();
    BottomController bottomController = Get.find();
    return Expanded(child: BlocBuilder<PackageBloc, PackageState>(
      builder: (context, state) {
        if (state is PackageInitial || state is PackageLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PackageError) {
          return const Center(
            child: Text('Have problem'),
          );
        } else if (state is PackageLoaded) {
          return ListView.builder(
            itemCount: state.packageList.length,
            itemBuilder: (context, index) {
              PackageModel packageModel = state.packageList[index];
              return Card(
                color: Constant.mainColor,
                child: Column(
                  children: [
                    Container(
                      color: Constant.subColor,
                      padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                      height: 70.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${packageModel.title}',
                              style: GoogleFonts.sourceSans3(
                                  color: Constant.white,
                                  fontSize: Constant.mediumTextSize,
                                  fontWeight: Constant.boldWeight)),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.menu_book, color: Constant.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: packageModel.levels?.length,
                        itemBuilder: (context, index) {
                          return LevelBoxWidget(index: index);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
        return Container();
      },
    )

        // ListView.builder(
        //   itemCount: 10,
        //   itemBuilder: (context, index) {
        //     //----------------------------------------------------------------
        //     return index % 4 == 0
        //         ? LevelBoxWidget(
        //             index: index,
        //           )
        //         //----------------------------------------------------------------
        //         : (index % 2 != 0 && index <= 5)
        //             ? LevelBoxWidget(
        //                 index: index,
        //               )
        //             //----------------------------------------------------------------
        //             : (index % 2 != 0 && index > 5)
        //                 ? LevelBoxWidget(
        //                     index: index,
        //                   )
        //                 //----------------------------------------------------------------
        //                 : LevelBoxWidget(
        //                     index: index,
        //                   );
        //   },
        // ),
        );
  }
}
