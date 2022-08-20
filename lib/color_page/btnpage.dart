import 'package:flutter/material.dart';
import 'package:flutter_application_1/color_page/btn.dart';

class Btnpage extends StatelessWidget {
  const Btnpage({Key? key, required this.color}) : super(key: key);
  final String color;
  @override
  Widget build(BuildContext context) {
    // print(color);
    return Scaffold(
      appBar: AppBar(
        title: Text("#${color.substring(4)}"),
        centerTitle: false,
        leading: const BackButton(),
        backgroundColor: Color(int.parse(color)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
        child: Column(
          children: [
            MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Btn(
                            btntype: MaterialButton(
                                minWidth: double.infinity,
                                height: 60,
                                onPressed: () {},
                                color: Color(int.parse(color)),
                                shape: BeveledRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text("BEVELED")),
                            color: color,
                            name: "Beveled")),
                  );
                },
                color: Color(int.parse(color)),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("Beveled")),
            const SizedBox(
              height: 80,
            ),
            MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {},
                color: Color(int.parse(color)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text("Continuous")),
            const SizedBox(
              height: 80,
            ),
            MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {},
                color: Color(int.parse(color)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("Rounded")),
            const SizedBox(
              height: 80,
            ),
            MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {},
                color: Color(int.parse(color)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: const Text("Stadium")),
            const SizedBox(
              height: 80,
            ),
            MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {},
                color: Color(int.parse(color)),
                shape: const CircleBorder(),
                child: const Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Text("Circle"),
                )),
          ],
        ),
      ),
    );
  }
}
