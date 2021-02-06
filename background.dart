import 'package:flutter/material.dart';
import 'dart:ui' as ui;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
return MaterialApp(
  home: HomePage(
  ),
);

  }
}

const Color backGround = Color(0xFF092C28);
const Color circle_color = Color(0xFFAAC97B);


class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
     decoration: BoxDecoration(
       gradient: LinearGradient(
         begin: Alignment.topCenter,
         end: Alignment.bottomCenter,
          stops:[0.1, 0.2, 0.4, 0.6,0.8,1.0],
         colors: [

           backGround.withOpacity(0.72),
           backGround.withOpacity(0.79),
           backGround.withOpacity(0.82),
           backGround.withOpacity(0.89),
           backGround.withOpacity(0.9),
           backGround,
         ]
       )
     ),

child: Container(
  child: CustomPaint(
    painter: DrawFig(),
  ),
),

   );
  }
}

class DrawFig extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    Paint paint =Paint()
      ..shader=ui.Gradient.linear(
        Offset(0,0),
        Offset(1000,2000),
        [
          circle_color,
          Colors.white.withOpacity(0.3),

        ],

      );
    //1
    canvas.drawCircle(Offset(395, 30),50,paint);
    //2
    canvas.drawCircle(Offset(-20, 210),90, paint);

    //3
    canvas.drawCircle(Offset(430, 405),50, paint);

    //4
    canvas.drawCircle(Offset(110, 650),60, paint);
    //5
    canvas.drawCircle(Offset(480, 850),200, paint);




  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


