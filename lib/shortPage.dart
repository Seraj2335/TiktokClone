import 'package:flutter/material.dart';
import 'package:short_video_application/mainPage.dart';

class HomePagee extends StatefulWidget {
  @override
  State<HomePagee> createState() => _HomePageeState();
}

class _HomePageeState extends State<HomePagee> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getFooter() {
    List bottomItems = [
      {"icon": Icons.home, "label": "Home", "isIcon": true},
      {"icon": Icons.search, "label": "Discover", "isIcon": true},
      {"icon": "", "label": "", "isIcon": false},
      {"icon": Icons.message, "label": "Inbox", "isIcon": true},
      {"icon": Icons.person, "label": "Me", "isIcon": true}
    ];
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.black12),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return bottomItems[index]['isIcon']
                ? InkWell(
                    onTap: () {
                      selectedTab(index);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          bottomItems[index]['icon'],
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            bottomItems[index]['label'],
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      selectedTab(index);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ));
          }),
        ),
      ),
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: <Widget>[
        HomePage(),
        Center(
          child: Text(
            "Discover",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
        ),
        Center(
          child: Text(
            "Upload",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
        ),
        Center(
          child: Text(
            "All Activity",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
        ),
        Center(
          child: Text(
            "Profile",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
        )
      ],
    );
  }
}
