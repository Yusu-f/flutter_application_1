import 'package:flutter/material.dart';

class Signuphome extends StatelessWidget {
  const Signuphome({Key? key}) : super(key: key);

  signup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Passions()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 89, 130),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            const Text(
              "ownawp",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
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
                      onPressed: () => signup(context),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Sign up")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Passions extends StatelessWidget {
  Passions({Key? key}) : super(key: key);

  final List<String> tilenames = [
    "Collecting",
    "Arts & Crafts",
    "Games",
    "Sports",
    "Food & Drinks",
    "Music"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "What is your passion?",
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisSize: MainAxisSize.max, children: const [
              Expanded(
                child: SizedBox(
                  height: 5,
                  // width: 300,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.black,
                    value: 10,
                    semanticsLabel: 'Linear progress indicator',
                  ),
                ),
              ),
              SizedBox(
                width: 100,
              ),
              Text("1/4"),
              // SliderTheme(
              //     data: SliderTheme.of(context).copyWith(
              //         // trackHeight: 28,
              //         activeTrackColor:
              //             const Color.fromARGB(255, 49, 89, 130),
              //         thumbShape: SliderComponentShape.noThumb),
              //     child: const MySlider())
            ]),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      Tile(title: tilenames[index]),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: 6),
            )
          ],
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  nextpage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Passions()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      contentPadding: const EdgeInsets.all(0),
      trailing: const Icon(Icons.arrow_forward),
    );
  }
}

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _currentSliderValue = 25;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 100,
      divisions: 4,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}

class Arts extends StatelessWidget {
  Arts({Key? key}) : super(key: key);

  void advance() {}

  final List<String> checkboxtilenames = [
    "Collecting",
    "Arts & Crafts",
    "Games",
    "Sports",
    "Food & Drinks",
    "Music"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Arts & Crafts",
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
              // const Text("1/4")
            ]),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      CheckboxTile(title: checkboxtilenames[index]),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: 6),
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

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({Key? key}) : super(key: key);

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return const Color.fromARGB(255, 49, 89, 130);
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

class CheckboxTile extends StatelessWidget {
  const CheckboxTile({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        contentPadding: const EdgeInsets.all(0),
        trailing: const MyCheckbox());
  }
}

class MyLinearbar extends StatefulWidget {
  const MyLinearbar({Key? key}) : super(key: key);

  @override
  State<MyLinearbar> createState() => _MyLinearbarState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyLinearbarState extends State<MyLinearbar>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Linear progress indicator with a fixed color',
              style: TextStyle(fontSize: 20),
            ),
            LinearProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),
          ],
        ),
      ),
    );
  }
}
