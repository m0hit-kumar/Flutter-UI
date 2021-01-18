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

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
//    final profileHeight = MediaQuery.of(context).size.height * 0.25;

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[200],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: cool,
            ),
            tooltip: 'Go to home',
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.edit,
                color: cool,
              ),
              tooltip: 'Edit Profile',
              onPressed: () {},
            ), //IconBut
          ], //IconBut,),
        ),
        body: Column(
          children: [
            Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(
                    radius: 50,
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.grey,
                  ),
                  title: Text(
                    'Sundhar Pichai',
                    style: TextStyle(
                        color: cool, fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  subtitle: Text(
                    '@Username',
                    style: TextStyle(color: cool, fontSize: 18),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.mail),
                    title: Text(
                      'sundharpichai@gmail.com',
                      style: TextStyle(
                        color: cool,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(
                      '0123-4567-8910',
                      style: TextStyle(
                        color: cool,
                      ),
                    ),
                  ),
                ],
              ),
            ),
             Table(
                border: TableBorder.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 0.4),
                children: [
                  TableRow(children: [
                    Column(
                      children: [
                        ListTile(
                          title: Center(
                            child: Text(
                              "2",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: Center(child: Text("Streak")),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ListTile(
                          title: Center(
                            child: Text(
                              "20",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: Center(child: Text("Postion")),
                        ),
                      ],
                    ),
                  ]),
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.group_outlined),
                    title: Text('About Us '
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.payment),
                    title: Text('Donate'),
                  ),
                  ListTile(
                    leading: Icon(Icons.group_add),
                    title: Text('Tell your Friend'),
                  ),
                  ListTile(
                    leading: Icon(Icons.feedback),
                    title: Text('Feedback'),
                  ),

                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                  ),
                ],
              ),
            ),



          ],
        ));
  }
}
