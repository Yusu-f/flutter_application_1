import 'package:flutter/material.dart';
import 'package:flutter_application_1/Providers/locations_provider.dart';
import 'package:flutter_application_1/controllers/myRow_controller.dart';
import 'package:flutter_application_1/models/rows.dart';
import 'package:provider/provider.dart';

// bottom sheet for location page
showCoordinatesBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32))),
    builder: (BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.80,
        child: Container(
          padding: const EdgeInsets.fromLTRB(27.0, 20.0, 27.0, 2.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 80,
                height: 5,
                decoration: const BoxDecoration(
                    color: Color(0xff656C6C),
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(64), right: Radius.circular(64))),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Farm Coordinates",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.green.shade50),
                      onPressed: () {
                        Provider.of<locationsProvider>(context, listen: false)
                            .addLocation();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: const [
                            Text("Add points"),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.add_circle_outline)
                          ],
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 400,
                child: ListView.separated(
                  itemBuilder: (context, index) => MyRowScreen(
                    row: Provider.of<locationsProvider>(context)
                        .locations[index],
                    index: index,
                  ),
                  separatorBuilder: (context, index) => Column(
                    children: const [
                      SizedBox(
                        height: 5,
                      ),
                      Divider(color: Colors.grey),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                  itemCount:
                      Provider.of<locationsProvider>(context).locations.length,
                ),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.fromLTRB(15, 30, 15, 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "3 hectares",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${Provider.of<locationsProvider>(context).locations.length}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Estimated Size"),
                        Text(
                            "${Provider.of<locationsProvider>(context).locations.length} points added")
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black54)),
                    onPressed: () {},
                    child: const Text("Save coordinates")),
              )
            ],
          ),
        ),
      );
    },
  );
}

