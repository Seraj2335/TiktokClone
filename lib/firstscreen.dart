import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Model {
  String display_image;
  String link;
  String published;
  String source_page;
  int timestamp;
  String title;
  Model(
      {required this.display_image,
      required this.link,
      required this.published,
      required this.source_page,
      required this.timestamp,
      required this.title});
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        display_image: json['display_image'] as String,
        link: json['link'] as String,
        published: json['published'] as String,
        source_page: json['source_page'] as String,
        timestamp: json['timestamp'],
        title: json['title']);
  }
}

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late Future<List<Model>> data;
  Future<List<Model>> getShortData() async {
    final response = await http.get(Uri.parse(
        'https://api.bottomstreet.com/socialMediaFeed?source=youtube'));

    final jsonData = jsonDecode(response.body) as List<dynamic>;
    List<Model> listData = jsonData.map((e) => Model.fromJson(e)).toList();
    return listData;
  }

  @override
  void initState() {
    data = getShortData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Model>>(
          future: data,
          builder: (context, snappshot) {
            if (!snappshot.hasData)
              return Center(
                child: CircularProgressIndicator(),
              );
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  child: Text(snappshot.data![index].timestamp.toString()),
                );
              },
              itemCount: snappshot.data!.length,
            );
          }),
    );
  }
}
