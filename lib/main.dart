import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'e-Vending machine'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          // const Text(
          //   'You have pushed the button this many times:',
          // ),
          // Text(
          //   '$_counter',
          //   style: Theme.of(context).textTheme.headline4,
          // ),
          ItemCard(
              itemName: "Bicycle",
              description: "get around, burn calories",
              icon: Icons.bike_scooter),
          ItemCard(
            itemName: "House",
            description: "roof over your head",
            icon: Icons.home,
          ),
          ItemCard(
            itemName: "Knife",
            description: "useful for cooking and settling scores",
            icon: Icons.fork_left,
          ),
          ItemCard(
              itemName: "Bicycle",
              description: "get around, burn calories",
              icon: Icons.bike_scooter),
          ItemCard(
            itemName: "House",
            description: "roof over your head",
            icon: Icons.home,
          ),
          ItemCard(
            itemName: "Knife",
            description: "useful for cooking and settling scores",
            icon: Icons.fork_left,
          ),
          ItemCard(
              itemName: "Bicycle",
              description: "get around, burn calories",
              icon: Icons.bike_scooter),
          ItemCard(
            itemName: "House",
            description: "roof over your head",
            icon: Icons.home,
          ),
          ItemCard(
            itemName: "Knife",
            description: "useful for cooking and settling scores",
            icon: Icons.fork_left,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Success'),
            content: const Text('Your order has been placed'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('Ok'),
              ),
            ],
          ),
        ),
        tooltip: 'Increment',
        label: const Text("Checkout"),
        // child: const Text(
        //   'Checkout',
        // ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ItemCard extends StatefulWidget {
  ItemCard(
      {Key? key,
      required this.itemName,
      required this.description,
      required this.icon})
      : super(key: key);

  final String itemName, description;
  final IconData icon;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // const Text(
        //   'You have pushed the button this many times:',
        // ),
        // Text(
        //   '$_counter',
        //   style: Theme.of(context).textTheme.headline4,
        // ),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(widget.icon),
                title: Text(widget.itemName),
                subtitle: Text(widget.description),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('-'),
                    onPressed: () {
                      setState(() {
                        if (count > 0) {
                          count--;
                        }
                      });
                    },
                  ),
                  // const SizedBox(
                  //   width: 8,
                  //   child: Text("data"),
                  // ),
                  Text("$count"),
                  TextButton(
                    child: const Text('+'),
                    onPressed: () {
                      setState(() {
                        count++;
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Dialog extends StatelessWidget {
  const Dialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
