import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Home(),
    ClientsPage(),
    Cash(),
    Transactions(),
    More()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Widget page = GroupedList();
      // switch (_selectedIndex) {
      //   case 0:
      //     page = const Home();
      //     break;
      //   case 1:
      //     page = const HomePage();
      //     break;
      //   case 2:
      //     page = const Cash();
      //     break;
      //   case 3:
      //     page = const Transactions();
      //     break;
      //   case 4:
      //     page = const More();
      //     break;
      //   default:
      // }
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => page),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Clients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Cash',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
    );
  }
}

class Cash extends StatelessWidget {
  const Cash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cash'),
      ),
    );
  }
}

class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
    );
  }
}

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('More'),
      ),
    );
  }
}

class ClientsPage extends StatelessWidget {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   // title: const Text('Clients'),
        //   backgroundColor: Colors,
        // ),
        body: Container(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
      child: Column(children: [
        const SizedBox(
          height: 60,
        ),
        Row(
          children: [
            const Text(
              "Clients",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(children: const [
          Text(
            "Last Synced: 4hrs ago",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 14,
            ),
          )
        ]),
        const SizedBox(
          height: 60,
        ),
        Row()
      ]),
    ));
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onLogin() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: onLogin,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
