import 'package:flutter/material.dart';

class Form2 extends StatelessWidget {
  Form2({Key? key}) : super(key: key);
  final List<String> list = ["Oyo", "Lagos", "Delta"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "House address",
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffD1D5DB),
              ),
            ),
            label: Text("Enter house address"),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "State of residence",
          ),
        ),
        DropdownButtonFormField(
          decoration: const InputDecoration(
            labelText: 'Select state',
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
            "Local government of residence",
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            label: Text("LGA of residence"),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffD1D5DB),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "State of origin",
          ),
        ),
        DropdownButtonFormField(
          decoration: const InputDecoration(
            labelText: 'Select state',
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
            "Local government of origin",
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
            label: Text("LGA of origin"),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffD1D5DB),
              ),
            ),
          ),
        ),
        // DropdownButtonFormField(items: const [], value: "cow", onChanged: (val) {print("val")}),
      ],
    );
  }
}
