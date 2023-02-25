import 'package:doulingo_fake/utils/constant.dart';
import 'package:doulingo_fake/views/home_view/bottom_tab.dart';
import 'package:doulingo_fake/views/home_view/top_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.mainColor,
      body: Container(
        child: Column(
          children: [
            TabBarWidget(),
            Body(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomTabWidget(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {

          return Text(
            'Địt mẹ thằng Khải',
            style: GoogleFonts.sanchez(
              color: Colors.red,
              fontSize: 18+index.toDouble(),
            ),
          );
        },
      ),
    );
  }
}
