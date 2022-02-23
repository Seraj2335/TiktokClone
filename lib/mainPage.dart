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
  bool isPlaying = false;
  // late VideoPlayerController _videoPlayerController;

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
    // _videoPlayerController = VideoPlayerController.network(
    //     'https://www.youtube.com/watch?v=A87FplRNS6Q')
    //   ..addListener(() {
    //     setState(() {});
    //   })
    //   ..setLooping(true)
    //   ..initialize().then((value) => _videoPlayerController.play());
    // setState(() {
    //   isPlaying = false;
    // });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    // _videoPlayerController.dispose();
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
                      (index) => SafeArea(
                            child: InkWell(
                              onTap: () {
                                // setState(() {
                                //   _videoPlayerController.value.isPlaying
                                //       ? _videoPlayerController.pause()
                                //       : _videoPlayerController.play();
                                // });
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
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: Stack(
                                        children: [
                                          // VideoPlayer(_videoPlayerController),
                                          Center(
                                              child: Icon(
                                            Icons.play_arrow,
                                            size: 80,
                                            color:
                                                Colors.white.withOpacity(0.7),
                                          )),
                                        ],
                                      ),
                                    ),
                                    LeftPannel(
                                      title: snapshot.data![index].title,
                                    ),
                                    RightPannel()
                                  ],
                                ),
                              ),
                            ),
                          ))));
        });
  }
}
