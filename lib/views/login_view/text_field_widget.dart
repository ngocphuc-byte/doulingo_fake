import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({super.key, required this.box});
  TextEditingController box;
  @override
  Widget build(BuildContext context) {
    return TextField(
      
      controller: box,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline6,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: (value) {
        value.length == 1
            ? FocusScope.of(context).nextFocus()
            : FocusScope.of(context).previousFocus();
      },
      decoration: InputDecoration(border: OutlineInputBorder()),
    );
  }
}
