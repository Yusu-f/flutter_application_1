import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/firstPage_controller.dart';
import 'package:flutter_application_1/views/stateless_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../farmer_signup/coordinates.dart';
import '../farmer_signup/page1.dart';
import '../farmer_signup/page2.dart';
import '../farmer_signup/page3.dart';
import '../farmer_signup/page4.dart';
import '../farmer_signup/page5.dart';

class FirstPageView
    extends StatelessView<FirstPageScreen, FirstPageController> {
  const FirstPageView(FirstPageController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.green,
        ),
        elevation: 0,
        leading: controller.currentStep == 0 ? const BackButton() : null,
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.all(5),
              width: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0xff54565B).withOpacity(0.1),
              ),
              child: SvgPicture.asset('assets/action/action.svg'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(
            opacity: controller.currentStep == 0 ? 0 : 1,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 97,
                height: 58,
                child: OutlinedButton(
                  onPressed: controller.cancel,
                  child: const Text("Back"),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 97,
              height: 58,
              child: ElevatedButton(
                  onPressed: controller.currentStep < 4
                      ? controller.continued
                      : controller.end,
                  child: Text(controller.currentStep < 4 ? "Next" : "Finish")),
            ),
          )
        ],
      )),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Register A new Farmer",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  controller.data[controller.currentStep],
                  // style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                )),
          ),
          Expanded(
            child: Stepper(
              type: StepperType.horizontal,
              physics: const ScrollPhysics(),
              currentStep: controller.currentStep,
              onStepTapped: (step) => controller.tapped(step),
              onStepContinue: controller.continued,
              onStepCancel: controller.cancel,
              controlsBuilder: (context, details) => const SizedBox(),
              elevation: 0,
              steps: <Step>[
                Step(
                  title: const Text(''),
                  content: Form1(),
                  isActive: controller.currentStep >= 0,
                ),
                Step(
                  title: const Text(''),
                  content: Form2(),
                  isActive: controller.currentStep >= 1,
                ),
                Step(
                  title: const Text(''),
                  content: Form3(),
                  isActive: controller.currentStep >= 2,
                ),
                Step(
                  title: const Text(''),
                  content: const Form4(),
                  isActive: controller.currentStep >= 3,
                ),
                Step(
                  title: const Text(''),
                  content: const Form5(),
                  isActive: controller.currentStep >= 4,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Image.asset("assets/api/maps.png"),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
                    child: Container(
                      height: 64,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffD1D5DB)),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            "assets/api/vuesax.svg",
                            color: Colors.green,
                          ),
                          const Text(
                            "4 coordinates added",
                          ),
                          TextButton(
                              onPressed: () {
                                showCoordinatesBottomSheet(context);
                              },
                              child: const Text("Click to add points"))
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
