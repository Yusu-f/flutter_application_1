import 'package:flutter/material.dart';

class Form3 extends StatelessWidget {
  Form3({Key? key}) : super(key: key);
  final List<String> list = ["Cooperative 1", "Cooperative 2"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Cooperative",
          ),
        ),
        DropdownButtonFormField(
          decoration: const InputDecoration(
            labelText: 'Select cooperative',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff38cb89),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffD1D5DB),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff38cb89),
                width: 2,
              ),
            ),
          ),
          items: list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (index) {},
        ),
        const SizedBox(
          height: 30,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Primary crops",
          ),
        ),
        DropdownButtonFormField(
          decoration: const InputDecoration(
            labelText: 'Select primary crops',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff38cb89),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffD1D5DB),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff38cb89),
                width: 2,
              ),
            ),
          ),
          items: list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (index) {},
        ),
        const SizedBox(
          height: 30,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Secondary crops",
          ),
        ),
        DropdownButtonFormField(
          decoration: const InputDecoration(
            labelText: 'Select secondary crops',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff38cb89),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffD1D5DB),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff38cb89),
                width: 2,
              ),
            ),
          ),
          items: list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (index) {},
        ),
        // DropdownButtonFormField(items: const [], value: "cow", onChanged: (val) {print("val")}),
      ],
    );
  }
}
