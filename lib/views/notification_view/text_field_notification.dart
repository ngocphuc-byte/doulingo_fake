import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constant.dart';

class TextFieldNotification extends StatelessWidget {
  TextFieldNotification(
      {super.key,
      required this.label,
      required this.textController,
      required this.isBool});
  String label;
  TextEditingController textController;
  bool isBool;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
          label: Text(
            '$label',
            style: GoogleFonts.sourceSans3(color: Constant.white),
          ),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Constant.grey)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Constant.grey))),
      maxLines: isBool ? 10 : 1,
      minLines: 1,
      keyboardType: TextInputType.multiline,
    );
  }
}
