import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MaterialApp(home: MyApp()));

const Color avtar_backGround = Color(0xFF2FCB72);
const Color avtar_backGround1 = Color(0xFF0C3329);
const Color prof_Card = Color(0xFF196F3D);
const Color grade1 = Color(0xFF00b09b);
const Color grade2 = Color(0xFF96c93d);
const Color cool = Color(0xFF181A2F);
const clickedColor = Color(0xFF0C3329);
const unclickedColor = Color(0xFF196F3D);
Color probtn = Color(0xFF0C3329);
Color leadbtn = Color(0xFF196F3D);
Color gold = Color(0xFFD0B13E);
Color silver = Color(0xFFE7E7E7);
Color bronze = Color(0xFFA45735);

//Color list_item = Colors.grey[200];
bool userRank = false;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> names = [
    "1",
    "2",
    "3",
    "4",
    "1",
    "2",
    "3",
    "4",
    "1",
    "2",
    "3",
    "4",
    "1",
    "2",
    "3",
    "4",
    "1",
    "2",
    "3",
    "4",
    "1",
    "2",
    "3",
    "4",
    "1",
    "2",
    "3",
    "4",
    "1",
    "2",
    "3",
    "4"
  ];
  List<String> litems = [
    "1",
    "2",
    "3",
    "4",
    "1",
    "2",
    "3",
    "4",
    "1",
    "2",
    "3",
    "4",
    "1",
    "2",
    "3",
    "4",
    "1",
    "2",
    "3",
    "4",
    "1",
    "2",
    "3",
    "4",
    "1",
    "2",
    "3",
    "4",
    "1",
    "2",
    "3",
    "4"
  ];

  @override
  Widget build(BuildContext context) {
//    final profileHeight = MediaQuery.of(context).size.height * 0.25;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        toolbarHeight: 200,
        // backgroundColor:unclickedColor,
        shadowColor: Colors.black,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  avtar_backGround1.withOpacity(0.8),
                  probtn,
                  unclickedColor
                ]),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 40, 0.0, 0.0),
            child: Column(
              children: [
                Text(
                  "LEADERBOARD",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.emoji_events_rounded,
                  color: gold,
                  size: 70,
                ),
              ],
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: avtar_backGround1,
            height: 50,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Postion",
                      style: TextStyle(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold)),
                  Text(
                    "Profile",
                    style:
                    TextStyle(
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Name",
                    style:
                    TextStyle(
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Score",
                    style: TextStyle(
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: cool,
          child: Card(
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            elevation: 0,
            color: Colors.red,
            child: Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("pos",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  CircleAvatar(
                    foregroundColor: Colors.green,
                  ),
                  Text(
                    "name",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Score",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 10,
                child: ListView.builder(
                  itemBuilder: (BuildContext txt, int index) =>
                      buildList(txt, index),
                  itemCount: litems.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildList(BuildContext txt, int index) {
    int ind = index + 1;
    final pos = litems[index];
    final name = names[index];

    Widget listItem;

    if (ind == 1) {
      listItem = Card(
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        shadowColor: Colors.grey[200],
        color: gold,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(pos,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              CircleAvatar(
                foregroundColor: Colors.green,
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Score",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      );
    } else if (ind == 2) {
      listItem = Card(
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        shadowColor: Colors.grey[200],
        color: silver,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(pos,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              CircleAvatar(
                foregroundColor: Colors.green,
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Score",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      );
    } else if (ind == 3) {
      listItem = Card(
        shadowColor: Colors.grey[200],
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        color: bronze,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(pos,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              CircleAvatar(
                foregroundColor: Colors.green,
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Score",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      );
    } else {
      listItem = Card(
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        shadowColor: Colors.grey[200],
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(pos,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              CircleAvatar(
                foregroundColor: Colors.green,
              ),
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Score",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      );
    }

    return Stack(
      children: [
        Container(
          color: Colors.grey[200],
          child: listItem,
        ),
      ],
    );
  }
}
