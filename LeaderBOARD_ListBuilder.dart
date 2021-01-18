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
        backgroundColor: cool.withOpacity(0.9),
        shadowColor: Colors.black,
        flexibleSpace: Padding(
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(color:cool.withOpacity(0.8),height: 50,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18.0,0.0,0.0,3.0),
              child: Container(
                child: Row(children: [
                Text("Postion", style: TextStyle(color: Colors.grey[200],fontWeight: FontWeight.bold)),
                SizedBox(width: 100,),
                Text(
                  "Name",
                  style: TextStyle(color: Colors.grey[200],fontWeight: FontWeight.bold),
                ),

              ],),),
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
            color: Colors.red ,
            child: ListTile(
              leading:
              Text("1", style: TextStyle(color: Colors.grey[200])),
              title:
              Text(
                "sundhar Pichai",
                style: TextStyle(color: Colors.grey[200]),
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
        child: ListTile(
          leading: Text(pos),
          title: Text(name),
        ),
      );
    } else if (ind == 2) {
      listItem = Card(
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        shadowColor: Colors.grey[200],
        color: silver,
        child: ListTile(
          leading: Text(pos),
          title: Text(name),
        ),
      );
    } else if (ind == 3) {
      listItem = Card(
        shadowColor: Colors.grey[200],
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        color: bronze,
        child: ListTile(
          leading: Text(pos),
          title: Text(name),
        ),
      );
    } else {
      listItem = Card(
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        shadowColor: Colors.grey[200],
        color: Colors.white,
        child: ListTile(
          leading: Text(pos),
          title: Text(name),
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
