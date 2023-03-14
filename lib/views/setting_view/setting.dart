import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
  SpeechToText speechToText = SpeechToText();
  var text = 'hold the button and start speaking';
  var isListening = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('$text'),
      ),
      floatingActionButton: FloatingActionButton(
        child: GestureDetector(
          onTapDown: (details) async {
            if(!isListening){
              var available = await speechToText.initialize();
              if(available){
                setState(() {
                  isListening = true;
                  speechToText.listen(
                    onResult: (result) {
                      setState(() {
                        text = result.recognizedWords;
                      });
                    },
                  );
                });
              }
            }
          },
          onTapUp: (details) {
            setState(() {
              isListening = false;
            });
            speechToText.stop();
          },
        ),
        onPressed: () {},
      ),
    );
  }
}
