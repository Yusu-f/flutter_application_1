import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/myRow_controller.dart';
import 'package:flutter_application_1/views/stateless_view.dart';

class MyRowView extends StatelessView {
  const MyRowView(MyRowController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleAvatar(
          backgroundColor: Colors.red.shade50,
          child: IconButton(
              onPressed: () {
                controller.deleteRow(context);
              },
              color: Colors.red,
              icon: const Icon(Icons.cancel_outlined)),
        ),
        Container(
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: const [
                          Text(
                            "Latitude",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.grey),
                        controller: TextEditingController(
                            text: controller.widget.row.latitude),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffD1D5DB),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 100,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: const [
                          Text(
                            "Longitude",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.grey),
                        controller: TextEditingController(
                            text: controller.widget.row.longitude),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffD1D5DB),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.green,
          ),
          child: IconButton(
              color: Colors.white,
              onPressed: () {
                controller.updateLocation(context);
              },
              icon: const Icon(Icons.gps_fixed_outlined)),
        )
      ],
    );
  }
}
