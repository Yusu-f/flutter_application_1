import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Form extends StatelessWidget {
  const Form({Key? key}) : super(key: key);

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
        TextFormField(
          decoration: const InputDecoration(
              label: Text("Select cooperative"),
              enabledBorder: OutlineInputBorder()),
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
        TextFormField(
          decoration: const InputDecoration(
              label: Text("Select primary crops"),
              enabledBorder: OutlineInputBorder()),
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
        TextFormField(
          decoration: const InputDecoration(
              label: Text("Select secondary crops"),
              enabledBorder: OutlineInputBorder()),
        ),
        // DropdownButtonFormField(items: const [], value: "cow", onChanged: (val) {print("val")}),
      ],
    );
  }
}

class Form4 extends StatelessWidget {
  const Form4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 142,
      decoration: BoxDecoration(
        color: const Color(0xff38CB89).withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          CircleAvatar(
            radius: 35,
            backgroundColor: const Color(0xff38CB89).withOpacity(0.1),
            child: SvgPicture.asset('assets/action/bank.svg'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Add a new bank account',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xff1D925D)),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
