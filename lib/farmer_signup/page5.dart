import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Form5 extends StatelessWidget {
  const Form5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Box();
  }
}

class Box extends StatelessWidget {
  const Box({
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
            child: SvgPicture.asset('assets/action/profilepic.svg'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Add farmer profile picture',
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
