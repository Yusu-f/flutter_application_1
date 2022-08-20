import 'package:flutter/material.dart';
import './home.dart';

class Location extends StatelessWidget {
  Location({Key? key}) : super(key: key);

  void advance() {}

  final List<String> checkboxtilenames = [
    "English",
    "Klingon",
    "Dothraki",
    "Dart",
    "Esperanto",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Where are you?",
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              Expanded(
                child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        // trackHeight: 28,
                        activeTrackColor:
                            const Color.fromARGB(255, 49, 89, 130),
                        thumbShape: SliderComponentShape.noThumb),
                    child: const MySlider()),
              ),
              const Text("1/4")
            ]),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  // width: 0.0 produces a thin "hairline" border
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 49, 89, 130), width: 0.0),
                ),
                labelText: 'Enter your location',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "e.g Talinn, Estonia",
              textAlign: TextAlign.start,
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    "Already have an account? Log in",
                    style: TextStyle(color: Colors.white),
                  ),
                  MaterialButton(
                      minWidth: double.infinity,
                      onPressed: advance,
                      color: const Color.fromARGB(255, 49, 89, 130),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Continue")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
