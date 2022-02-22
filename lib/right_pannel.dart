import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RightPannel extends StatelessWidget {
  showModal(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              color: Colors.black26,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .3,
          right: 10,
          left: MediaQuery.of(context).size.width * 0.85),
      width: MediaQuery.of(context).size.width * 0.15,
      height: MediaQuery.of(context).size.height,
      child: Column(children: [
        Container(
            child: IconButton(
          onPressed: () {
            showModal(context);
          },
          icon: Icon(
            Icons.description,
            color: Colors.white,
            size: 30,
          ),
        )),
        SizedBox(
          height: 18,
        ),
        Container(
            child: Column(children: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.thumb_up_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          Text(
            '100',
            style: TextStyle(color: Colors.white),
          )
        ])),
        SizedBox(
          height: 18,
        ),
        Container(
            child: Column(children: [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.thumb_down_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          Text(
            'Dislike',
            style: TextStyle(color: Colors.white),
          )
        ])),
        SizedBox(
          height: 18,
        ),
        Column(children: [
          IconButton(
            onPressed: () {
              showModal(context);
            },
            icon: Icon(
              Icons.comment,
              color: Colors.white,
              size: 30,
            ),
          ),
          Text(
            '100',
            style: TextStyle(color: Colors.white),
          )
        ]),
        SizedBox(
          height: 18,
        ),
        Container(
            child: Column(children: [
          IconButton(
            onPressed: () {
              showModal(context);
            },
            icon: Icon(
              Icons.share,
              color: Colors.white,
              size: 30,
            ),
          ),
          Text(
            '100',
            style: TextStyle(color: Colors.white),
          )
        ]))
      ]),
    );
  }
}
