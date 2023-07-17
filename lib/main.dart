import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutter",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("TEXT TO SPEECH")),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: TextToSpeech(),
        ),
      ),
    );
  }
}

class TextToSpeech extends StatelessWidget {
  final FlutterTts _flutterTts = FlutterTts();
  final TextEditingController _textEditingController = TextEditingController();

  speak(String text) async {
    await _flutterTts.setLanguage("en-US");
    await _flutterTts.setPitch(1.0);
    await _flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        //padding: EdgeInsets.all(8),
        child: Container(
          color: Color.fromARGB(255, 229, 238, 230),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Text',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300.0,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () => speak(_textEditingController.text),
                    child: Text("Speak"),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
