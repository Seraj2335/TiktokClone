import 'package:flutter/material.dart';
import 'package:http/retry.dart';

class ShortPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 290, top: 220),
            width: 70,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(children: [
              Container(
                  child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.description,
                  color: Colors.white,
                ),
              )),
              SizedBox(
                height: 15,
              ),
              Container(
                  child: Column(children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.thumb_up_outlined,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '100',
                  style: TextStyle(color: Colors.white),
                )
              ])),
              SizedBox(
                height: 15,
              ),
              Container(
                  child: Column(children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.thumb_down_outlined,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Dislike',
                  style: TextStyle(color: Colors.white),
                )
              ])),
              SizedBox(
                height: 15,
              ),
              Column(children: [
                IconButton(
                  onPressed: () {
                    //Hello
                  },
                  icon: Icon(
                    Icons.comment,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '100',
                  style: TextStyle(color: Colors.white),
                )
              ]),
              SizedBox(
                height: 10,
              ),
              Container(
                  child: Column(children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '100',
                  style: TextStyle(color: Colors.white),
                )
              ]))
            ]),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, top: 10, right: 15),
            height: 80,
            margin: EdgeInsets.only(top: 590),
            width: 280,
            child: Text(
              'Wild Animal of the roasting fields',
              style: TextStyle(fontSize: 18, color: Colors.white),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }

  // Widget footer(BuildContext context) {
  //   final size = MediaQuery.of(context).size;
  //   return Container(
  //     height: size.height * 0.15,
  //     width: size.width,
  //     color: Colors.black,
  //   );
  // }
}
