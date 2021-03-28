import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
//import 'package:provider/provider.dart';
import 'dart:io';

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
Color x = Color(0xff40878b);

var successfulUploadedDate;

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
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 0.0, 0.0),
          child: ListView(padding: EdgeInsets.zero, children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: avtar_backGround1,
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
            Container(
              width: 70,
              height: 1,
              color: Colors.grey[300],
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Home",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Container(
              width: 70,
              height: 1,
              color: Colors.grey[300],
            ),
            ListTile(
              leading: Icon(Icons.leaderboard_rounded),
              title: Text(
                "Leaderboard",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Container(
              width: 70,
              height: 1,
              color: Colors.grey[300],
            ),
            ListTile(
              leading: Icon(Icons.comment),
              title: Text(
                "About",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Container(
              width: 70,
              height: 1,
              color: Colors.grey[300],
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                "Contact",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Container(
              width: 70,
              height: 1,
              color: Colors.grey[300],
            ),
            SizedBox(
              height: 100,
            ),
            ListTile(
                leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.logout,
                color: Colors.black,
              ),
            )),
          ]),
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
  var image;
  PickedFile myImage;
  // File x;

  // Future<File>imageFile;
  // Widget showImage(){
  //   return ChangeNotifierProvider<HomePageViewModel>(
  //     create: (context) => HomePageViewModel(),
  //     child: Consumer<HomePageViewModel>(
  //         builder: (context, viewModel, child)  {
  //           return Center(
  //             child:
  //             viewModel.image != null ? Image.file(
  //               viewModel.image,
  //               cacheWidth: 250,
  //             ):Text("try again"),
  //
  //           );
  //         }
  //     ),
  //   );
  // }

  // Widget showImage2() {
  //   return FutureBuilder<File>(
  //     future: imageFile,
  //     builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done &&
  //           snapshot.data != null) {
  //         return Image.file(
  //           snapshot.data,
  //           width: 300,
  //           height: 300,
  //         );
  //       } else if (snapshot.error != null) {
  //         return const Text(
  //           'Error Picking Image',
  //           textAlign: TextAlign.center,
  //         );
  //       } else {
  //         return const Text(
  //           'No Image Selected',
  //           textAlign: TextAlign.center,
  //         );
  //       }
  //     },
  //   );
  // }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your Image'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.file(File(image.path)),
                ),
              ),
              Container(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.clear_rounded),
                            Text('Cancel'),
                          ],
                        ),
                      ),
                      color: Colors.white,
                      textColor: avtar_backGround1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(width: 0.1)),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    ),
                    RaisedButton(
                      onPressed: () {
                        imageUploader(myImage);
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.upload_rounded),
                            Text('Submit'),
                          ],
                        ),
                      ),
                      color: avtar_backGround1,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          side: BorderSide(width: 0.1)),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void displayBottomCameraMenu(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Container(
            height: 250.0,
            child: new Container(
                decoration: new BoxDecoration(
                    color: avtar_backGround1,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: new Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          //  width: 400,
                          //  height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Upload Photo",
                                style: TextStyle(
                                    color: Colors.grey[200],
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    wordSpacing: 1.0),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.clear,
                                    color: Colors.grey[200],
                                  )),
                            ],
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10.0)),
                        ),
                        GestureDetector(
                          onTap: () async {
                            image = await ImagePicker()
                                .getImage(source: ImageSource.camera);
                            print(
                                "------------------------------------------------------------------------");
                            print(image);
                            print(
                                "------------------------------------------------------------------------");
                            //  viewModel.setImage(File(image.path));
                            //     print(viewModel.image);

                            print(
                                "------------------------------------------------------------------------");

                            myImage = image;
                            print('xxxxxxxxxxxxxxxxxxxxxx$myImage');
                            print('xxxxxxxxxxxxxxxxxxxxxx$image');
                            Navigator.pop(context);

                            _showMyDialog();
                          },
                          child: Container(
                            width: 400,
                            height: 60,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    unclickedColor.withOpacity(0.4),
                                child: Center(
                                  child: Icon(
                                    Icons.cloud_upload_outlined,
                                    color: Colors.grey[200],
                                  ),
                                ),
                              ),
                              title: Text("Click Image",
                                  style: TextStyle(
                                      color: Colors.grey[200],
                                      letterSpacing: 0.5,
                                      fontSize: 20,
                                      wordSpacing: 1.0)),
                            ),
                            decoration: BoxDecoration(
                                //      color: Colors.greenAccent,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            image = await ImagePicker()
                                .getImage(source: ImageSource.gallery);
                            print(
                                "------------------------------------------------------------------------");
                            print(image);
                            print(
                                "------------------------------------------------------------------------");
                            //viewModel.setImage(File(image.path));
                            //   print(viewModel.image);

                            myImage = image;
                            print('xxxxxxxxxxxxxxxxxxxxxx$myImage');
                            print('xxxxxxxxxxxxxxxxxxxxxx$image');
                            Navigator.pop(context);

                            _showMyDialog();
                          },
                          child: Container(
                            width: 400,
                            height: 60,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    unclickedColor.withOpacity(0.4),
                                child: Center(
                                  child: Icon(
                                    Icons.drive_folder_upload,
                                    color: Colors.grey[200],
                                  ),
                                ),
                              ),
                              title: Text("From Gallery",
                                  style: TextStyle(
                                      color: Colors.grey[200],
                                      letterSpacing: 0.5,
                                      fontSize: 20,
                                      wordSpacing: 1.0)),
                            ),
                            decoration: BoxDecoration(
                                //      color: Colors.greenAccent,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          );
        });
  }

  void alreadyUploadedMsg(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return Center(
            child: AlertDialog(
              content: SingleChildScrollView(
                child: ListTile(
                  leading: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 60,
                  ),
                  title: Text(
                    "Already Submitted",
                    style: TextStyle(
                        letterSpacing: 0.8,
                        color: cool,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      "You already submitted your today's image, it will now open tomorrow.",
                      // style: TextStyle(
                      //     color: cool, fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              // actions: <Widget>[
              //   TextButton(
              //     child: Text('Okay'),
              //     onPressed: () {
              //       Navigator.of(context).pop();
              //     },
              //   ),
              // ],
            ),
          );
        });
  }

  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          setState(() {
            xOffset = 0;
            yOffset = 0;
            isDrawerOpen = false;
          });
        },
        onHorizontalDragStart: (DragStartDetails details) {
          print("");
          print("horizontalxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
          print(details);
        },
        onVerticalDragStart: (DragStartDetails details) {
          print("");
          print("verticle");
          print(details);
        },
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          print("");
          print("update horizontal");
          print(details);
          print("//////////////////global");
          print(details.globalPosition);
          print(details.globalPosition.dx);
          print(details.globalPosition.dy);
          print(details.globalPosition.direction);
          print("//////////////////local");
          print(details.localPosition);
          print(details.localPosition.dx);
          print(details.localPosition.dy);
          print(details.localPosition.direction);

          print("//////////////////delta");
          print(details.delta);
          print(details.delta.dx);
          print(details.delta.dy);
          print(details.delta.direction);
          if (details.delta.dx > 0) {
            setState(() {
              xOffset = 290;
              yOffset = 80;
              isDrawerOpen = true;
            });
          } else {
            setState(() {
              xOffset = 0;
              yOffset = 0;
              isDrawerOpen = false;
            });
          }
        },
        onVerticalDragUpdate: (DragUpdateDetails details) {
          print("");
          print("update verticle");
          print(details);
        },
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: isDrawerOpen
                ? BorderRadius.circular(28.0)
                : BorderRadius.circular(0.0),
            color: avtar_backGround1,
          ),
          duration: Duration(milliseconds: 200),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(isDrawerOpen ? 0.85 : 1.00)
            ..rotateZ(isDrawerOpen ? -50 : 0),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(30.0),
                child: isDrawerOpen
                    ? GestureDetector(
                        child:
                            Icon(Icons.arrow_back_ios, color: Colors.grey[200]),
                        onTap: () {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            isDrawerOpen = false;
                          });
                        },
                      )
                    : GestureDetector(
                        child: Icon(Icons.menu, color: Colors.grey[200]),
                        onTap: () {
                          setState(() {
                            xOffset = 290;
                            yOffset = 80;
                            isDrawerOpen = true;
                          });
                        },
                      ),
              ),
              successfulUploadedDate == DateTime.now()
                  ? Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1,
                      child: FloatingActionButton(
                        onPressed: () {
                          alreadyUploadedMsg(context);
                        },
                        backgroundColor: Colors.lightGreen.withOpacity(0.9),
                        child: Icon(
                          Icons.camera_alt_rounded,
                          size: 35,
                        ),
                      ),
                    )
                  : Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.1,
                      right: MediaQuery.of(context).size.width * 0.1,
                      child: FloatingActionButton(
                        onPressed: () {
                          displayBottomCameraMenu(context);
                        },
                        backgroundColor: Colors.lightGreen.withOpacity(0.9),
                        child: Icon(
                          Icons.camera_alt_rounded,
                          size: 35,
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: missing_return
Future<String> imageUploader(PickedFile myImage) async {
  try {
    print('xxxxxxxxxxxx------------xxxxxxxxxx$myImage');
    //String filename=myImage.path.split('/').last;
    String filename = myImage.path.toString();
    print('');
    print('%%%%%%%%%%$filename');
    print('');
    var request = await http.MultipartRequest(
        'POST', Uri.parse('http://green-earth.herokuapp.com/uploadphoto'));
    print('');
    print('###########');
    print('');
    request.files.add(await http.MultipartFile.fromPath('image', filename));
    print('zzzzzzzzzzzzzzzzzzzzzzz');

    var res = await request.send();
    print(res);
    print("");
    print('mmmmmmmmmmmmmmmmmmmm');
    print(res.statusCode);
    if (res.statusCode == 200) {
      print("image uploaded");
      successfulUploadedDate = DateTime.now();

    } else {
      print('error');
    }
  } catch (e) {
    print(e);
    print("image not uploaded");
  }
}
