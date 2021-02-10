import 'package:flutter/material.dart';

void main() => runApp(MyApp());
const Color cool = Color(0xFF181A2F);
const Color avtar_backGround = Color(0xFF2FCB72);
const Color avtar_backGround1 = Color(0xFF0C3329);
const Color prof_Card = Color(0xFF196F3D);
const Color grade1 = Color(0xFF00b09b);
const Color grade2 = Color(0xFF96c93d);
const clickedColor = Color(0xFF0C3329);
const unclickedColor = Color(0xFF196F3D);
Color probtn = Color(0xFF0C3329);
Color leadbtn = Color(0xFF196F3D);
Color x=Color(0xff40878b);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            MainScreen(),
          ],
        ),
      ),
    );
  }
}

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: x.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 38.0, 0.0, 0.0),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                foregroundColor: Colors.blue,
                backgroundColor: Colors.brown,
              ),
              title: Text(
                'Sundhar Pichai',
                style: TextStyle(
                    color: cool, fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                "Text",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[200]),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                "Text",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[200]),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                "Text",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[200]),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                "Text",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[200]),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                "Text",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[200]),
              ),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                "Text",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.grey[200]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(28.0)
              : BorderRadius.circular(0.0),
          color:Color(0xff125862).withOpacity(0.9),
        ),
        duration: Duration(milliseconds: 200),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(isDrawerOpen ? 0.85 : 1.00)
          ..rotateZ(isDrawerOpen ? -50 : 0),
        child: isDrawerOpen
            ? GestureDetector(
                child: Icon(Icons.arrow_back_ios,color: Colors.grey[200]),
                onTap: () {
                  setState(() {
                    xOffset = 0;
                    yOffset = 0;
                    isDrawerOpen = false;
                  });
                },
              )
            : GestureDetector(
                child: Icon(Icons.menu,color: Colors.grey[200]),
                onTap: () {
                  setState(() {
                    xOffset = 290;
                    yOffset = 80;
                    isDrawerOpen = true;
                  });
                },
              ),
      ),
    );
  }
}
