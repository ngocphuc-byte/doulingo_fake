import 'package:doulingo_fake/views/home_view/home_page.dart';
import 'package:doulingo_fake/views/instruction_view/instuction_page.dart';
import 'package:doulingo_fake/views/introduce_view/introduce_page.dart';
import 'package:doulingo_fake/views/login_view/login_page.dart';
import 'package:doulingo_fake/views/login_view/signup_page.dart';
import 'package:get/get.dart';

class RoutePage {
  static String initialPage = '/';
  static String loginPage = '/login';
  static String signUpPage = '/signup';
  static String instructionPage = '/instruction';
  static String homePage = '/homePage';

  static List<GetPage> listRoutePage = [
    GetPage(
      name: initialPage,
      page: () => const IntroducePage(),
    ),
    GetPage(
      name: loginPage,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: signUpPage,
      page: () => const SignUpPage(),
    ),
    GetPage(
      name: instructionPage,
      page: () => const InstructionPage(),
    ),
    GetPage(
      name: homePage,
      page: () => const HomePage(),
    ),
  ];
}
