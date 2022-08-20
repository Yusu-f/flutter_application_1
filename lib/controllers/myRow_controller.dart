import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/myRow_view.dart';
import 'package:provider/provider.dart';

import '../Providers/locations_provider.dart';
import '../models/rows.dart';

class MyRowScreen extends StatefulWidget {
  const MyRowScreen({Key? key, required this.row, required this.index}) : super(key: key);
  final LocationRow row;
  final int index;

  @override
  State<MyRowScreen> createState() => MyRowController();
}

class MyRowController extends State<MyRowScreen> {
  updateLocation(context) {
    Provider.of<locationsProvider>(context, listen: false)
        .updateLocation(widget.index);
  }

  deleteRow(context) {
    Provider.of<locationsProvider>(context, listen: false)
        .deleteLocation(widget.index);
  }
  
  @override
  Widget build(BuildContext context) {
    return MyRowView(this);
  }
}