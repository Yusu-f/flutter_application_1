import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  const Btn(
      {Key? key,
      required this.btntype,
      required this.color,
      required this.name})
      : super(key: key);
  final Widget btntype;
  final String color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$name #${color.substring(4)}"),
        centerTitle: false,
        leading: const BackButton(),
        backgroundColor: Color(int.parse(color)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(child: btntype),
      ),
    );
  }
}
