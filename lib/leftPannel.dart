import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeftPannel extends StatelessWidget {
  String title;
  LeftPannel({required this.title});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, top: 10, right: 10),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: Colors.white,
                fontFamily: 'Montserrat'),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          margin: EdgeInsets.only(top: 520),
          height: MediaQuery.of(context).size.height * 0.10,
          width: MediaQuery.of(context).size.width * 0.7,
        )
      ],
    );
  }
}
