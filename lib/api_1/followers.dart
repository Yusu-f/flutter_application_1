import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_1/login.dart';
import 'package:flutter_application_1/models/dev.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Followers extends StatelessWidget {
  const Followers(
      {Key? key,
      required this.developer,
      required this.followers,
      required this.following})
      : super(key: key);
  final String developer;
  final String followers;
  final String following;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(developer),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Text("Followers")),
              Tab(icon: Text("Following")),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabBarView(
            children: [
              MyFollowers(uri: followers),
              MyFollowers(uri: following),
            ],
          ),
        ),
      ),
    );
  }
}

class MyFollowers extends StatelessWidget {
  MyFollowers({Key? key, required this.uri}) : super(key: key);
  late List<Developer> followers;
  final String uri;

  Future<List<Developer>?> fetchDeveloper() async {
    final response = await http.get(Uri.parse(uri));
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchDeveloper(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            List<User> items = snapshot.data as List<User>;

            return DevCards(items: items);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
