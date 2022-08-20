import 'package:flutter/material.dart';
import './home.dart';

class languages extends StatelessWidget {
  languages({Key? key}) : super(key: key);

  final List<String> checkboxtilenames = [
    "English",
    "Klingon",
    "Dothraki",
    "Dart",
    "Esperanto",
  ];

  @override
  Widget build(BuildContext context) {
    void advance() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Passions()),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "What languages do you speak",
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
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      CheckboxTile(title: checkboxtilenames[index]),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: 5),
            ),
            // const Expanded(child: SizedBox()),
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
