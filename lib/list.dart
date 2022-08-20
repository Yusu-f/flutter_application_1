import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class GroupedList extends StatelessWidget {
  GroupedList({Key? key}) : super(key: key);

  final List _elements = [
    {'name': 'John', 'group': '12 May 2022'},
    {'name': 'Will', 'group': '12 May 2022'},
    {'name': 'Beth', 'group': '12 May 2022'},
    {'name': 'Miranda', 'group': '11 May 2022'},
    {'name': 'Mike', 'group': '10 May 2022'},
    {'name': 'Danny', 'group': '10 May 2022'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_outlined),
        title: const Text('Notifications'),
      ),
      body: GroupedListView<dynamic, String>(
        elements: _elements,
        groupBy: (element) => element['group'],
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (item1, item2) =>
            item1['name'].compareTo(item2['name']),
        order: GroupedListOrder.DESC,
        useStickyGroupSeparators: true,
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
          ),
        ),
        itemBuilder: (c, element) {
          return Card(
            elevation: 0,
            margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            child: SizedBox(
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                // leading: const Icon(Icons.account_circle),
                title: const Text("Loan approved for Abdulaziz Wahab"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("LN-56748934983489"),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        Text("Outreach Officer loan"),
                        Expanded(
                            child: Text(
                          "12:20PM",
                          textAlign: TextAlign.end,
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 1,
                      thickness: .5,
                      indent: 0,
                      endIndent: 0,
                      color: Colors.grey,
                    ),
                  ],
                ),
                // trailing: const Icon(Icons.arrow_forward),
              ),
            ),
          );
        },
      ),
    );
  }
}
