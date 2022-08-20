import 'package:flutter/material.dart';
import 'package:flutter_application_1/color_page/btnpage.dart';

class Colorhome extends StatelessWidget {
  Colorhome({Key? key}) : super(key: key);

  final List colors = [
    ["0xff607d8b", "0xff795448"],
    ['0xffff5722', "0xffff9800"],
    ["0xffffc107", "0xffffeb3b"],
    ["0xffcddc39", "0xff8bc34a"],
    ["0xff4caf50", "0xff009688"],
    ["0xff00bcd4", "0xff03a9f4"],
    ["0xff2196f3", "0xff3f51b5"],
    ["0xff673ab7", "0xff9c27b0"],
    ["0xffe91e63", "0xfff44336"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: false,
        // leading: const Icon(Icons.arrow_back_outlined),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: ListView.builder(
            itemBuilder: (context, index) => BtmCol(
              color1: colors[index][0],
              color2: colors[index][1],
            ),
            itemCount: colors.length,
          )),
    );
  }
}

class BtmCol extends StatelessWidget {
  const BtmCol({Key? key, required this.color1, required this.color2})
      : super(key: key);
  final String color1;
  final String color2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Btnpage(
                            color: color1,
                          )),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color(int.parse(color1))),
              ),
              child: Text("#${color1.substring(4)}"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Btnpage(
                            color: color2,
                          )),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color(int.parse(color2))),
              ),
              child: Text("#${color2.substring(4)}"),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
