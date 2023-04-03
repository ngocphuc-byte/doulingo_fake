import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:doulingo_fake/controllers/room_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SpeechScreen(),
    );
  }
}

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({super.key});

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  @override
  Widget build(BuildContext context) {
    final platform = MethodChannel('openCamera');
    Future openCamera() async {
      try {
        final String result = await platform.invokeMethod('test');
        print(result);
      } catch (e) {
        print(e);
      }
    }

    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              openCamera();
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
