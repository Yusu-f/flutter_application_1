import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApiHome extends StatelessWidget {
  const ApiHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/api/Group_1.svg'),
            const Text(
              "Logistics",
              style: TextStyle(fontSize: 18),
            ),
            SvgPicture.asset('assets/api/Service.svg')
          ],
        ),
      ),
    );
  }
}
