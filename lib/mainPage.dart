import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:short_video_application/leftPannel.dart';
import 'package:short_video_application/right_pannel.dart';
import 'package:http/http.dart' as http;
import 'package:short_video_application/model.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
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

    _tabController = TabController(length: 142, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Model>>(
        future: data,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          return RotatedBox(
              quarterTurns: 0,
              child: TabBarView(
                  controller: _tabController,
                  children: List.generate(
                      snapshot.data!.length,
                      (index) => VideoPlayerItem(
                          display_image: snapshot.data![index].display_image,
                          link: snapshot.data![index].link,
                          published: snapshot.data![index].published,
                          source_page: snapshot.data![index].source_page,
                          timestamp: snapshot.data![index].timestamp,
                          title: snapshot.data![index].title))));
        });
  }
}

class VideoPlayerItem extends StatefulWidget {
  String display_image;
  String title;
  int timestamp;
  String link;
  String published;
  String source_page;
  VideoPlayerItem(
      {required this.display_image,
      required this.link,
      required this.published,
      required this.source_page,
      required this.timestamp,
      required this.title});
  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _videoController;

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(widget.link)
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((value) {
        _videoController.play();
        setState(() {
          isPlaying = false;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: () {
          setState(() {
            _videoController.value.isPlaying
                ? _videoController.pause()
                : _videoController.play();
          });
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 420),
                child: Center(
                  child: Text(
                    'Following  ' + "|" + '  For You',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    VideoPlayer(_videoController),
                    Center(
                        child: Icon(
                      _videoController.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 80,
                      color: Colors.white.withOpacity(0.7),
                    )),
                  ],
                ),
              ),
              LeftPannel(
                title: widget.title,
              ),
              RightPannel()
            ],
          ),
        ),
      ),
    );
  }
}
