import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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