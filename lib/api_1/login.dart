import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_1/followers.dart';
import 'package:flutter_application_1/models/dev.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatelessWidget {
  const Login({Key? key, required this.token}) : super(key: key);
  final String token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
        child: Column(
          children: [
            SizedBox(
              height: 146,
              child: Container(
                child: Stack(children: [
                  Container(
                    width: double.infinity,
                    height: 146,
                    color: const Color(0xff858585),
                    child: Image.asset(
                      "assets/api/bg.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/api/card.svg",
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Logistics Officer",
                            style: TextStyle(color: Colors.white)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  "Aaron Charles",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text("ID: 234223-01",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                "https://s3-alpha-sig.figma.com/img/284a/1234/738006107e0296f87e47f9cf74eff7cb?Expires=1658102400&Signature=LyLZd5Mhfsa2OSrfnZGR4OqTaQAjQdeixlvnx-9UodsJ~xgJMpsfHKqaUplHUwmRh1oXY8saq2kORY7qOdthyqeKhmLt5aFBCF2Pok2wR-vzk-FKb2vhf9pXJ0NxejtLly2nKQc~Hc6jULRzcsvvvvPxLrBgLJIQw3Dl7om4Wzdut0G3bTVh6s~YQhGQxig0K7P6yET~plaFzRfQZY1lFHWLen0BbGyRuACFouDzBqyNsYyaOhiVXtaTlhIPxevCRbtS5I851diAdRVjg1Qne7I9-Wx9-nfxjj7Mm4ulJUs~WKexP-59OfX3mnsVg3OFkl7KQyFgfMZIsZDO2RK4JQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                                width: 75,
                                height: 75,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/api/location.svg"),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("kano",
                                style: TextStyle(color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    offset: const Offset(6, 6),
                    blurRadius: 1)
              ]),
              child: const TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  label: Text("Search Clients"),
                  fillColor: Color(0xffffffff),
                  filled: true,
                ),
              ),
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            const MyDeveloper()
          ],
        ),
      ),
    );
  }
}

class MyDeveloper extends StatefulWidget {
  const MyDeveloper({Key? key}) : super(key: key);

  @override
  State<MyDeveloper> createState() => _MyDeveloperState();
}

class _MyDeveloperState extends State<MyDeveloper> {
  late List<Developer> developers;

  Future<List<Developer>?> fetchDeveloper() async {
    final response = await http.get(Uri.parse('https://api.github.com/users'));
    List<Developer> developers = [];
    if (response.statusCode == 200) {
      try {
        var results = await jsonDecode(response.body) as List;
        developers = results.map((e) => Developer.fromJson(e)).toList();
      } catch (e) {
        // print(e);
      }
      return developers;
    }
    return null;
  }

  Future<List> fetchUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users'));
    List users = [];
    if (response.statusCode == 200) {
      try {
        var results = await jsonDecode(response.body)['data'];
        print(results);
        users = results.map((e) => User.fromJson(e)).toList();
        print(users);
      } catch (e) {
        // print(e);
      }
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            print(snapshot.data);
            List items = snapshot.data;

            return DevCards(items: items);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

class DevCards extends StatelessWidget {
  const DevCards({Key? key, required this.items}) : super(key: key);
  final List items;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemBuilder: (context, index) => Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Followers(
                            developer: items[index].name,
                            followers:
                                "https://api.github.com/users/${items[index].name}/followers",
                            following:
                                "https://api.github.com/users/${items[index].name}/following",
                          )),
                ),
                child: Card(
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    color: const Color(0xfff9f9fa),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              "${items[index].pic}",
                              width: 50,
                              height: 50,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(items[index].name),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text("User"),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
              ),
            )
          ],
        ),
        itemCount: items.length,
      ),
    );
  }
}
