import 'package:doulingo_fake/bloc/blog/blog_bloc.dart';
import 'package:doulingo_fake/bloc/login/login_bloc.dart';
import 'package:doulingo_fake/bloc/package/package_bloc.dart';
import 'package:doulingo_fake/bloc/question/question_bloc.dart';
import 'package:doulingo_fake/bloc/vocabulary/vocabulary_bloc.dart';
import 'package:doulingo_fake/helper/dependencies.dart';
import 'package:doulingo_fake/helper/route.dart';
import 'package:doulingo_fake/views/introduce_view/introduce_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('login');
  await Hive.openBox('vocabulary');

  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(350, 700),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginBloc(),
            ),
            BlocProvider(
              create: (context) => PackageBloc(),
            ),
            BlocProvider(
              create: (context) => QuestionBloc(),
            ),
            BlocProvider(
              create: (context) => VocabularyBloc(),
            ),
            BlocProvider(
              create: (context) => BlogBloc(),
            ),
          ],
          child: GetMaterialApp(
            initialBinding: Dependencies(),
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
            getPages: RoutePage.listRoutePage,
          ),
        );
      },
      child: const IntroducePage(),
    );
  }
}
