import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/firstPage_view.dart';

import '../farmer_signup/page1.dart';

class FirstPageScreen extends StatefulWidget {
  const FirstPageScreen({Key? key}) : super(key: key);

  @override
  State<FirstPageScreen> createState() => FirstPageController();
}

class FirstPageController extends State<FirstPageScreen> {
  int currentStep = 0;

  final List<String> data = [
    "Personal Information",
    "Geographical Information",
    "Farm Information",
    "Bank Information",
    "Add Information"
  ];

  tapped(int step) {
    setState(() => currentStep = step);
  }

  continued() {
    currentStep < 4 ? setState(() => currentStep += 1) : null;
  }

  cancel() {
    currentStep > 0 ? setState(() => currentStep -= 1) : null;
  }

  void end() {
    myBottomSheet(context);
  }

  @override
  Widget build(BuildContext context) {
    return FirstPageView(this);
  }
}
