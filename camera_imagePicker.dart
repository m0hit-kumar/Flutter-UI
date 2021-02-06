import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
const Color cool = Color(0xFF181A2F);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider<HomePageViewModel>(
        create: (context) => HomePageViewModel(),
        child: Consumer<HomePageViewModel>(
          builder: (context, viewModel, child) {
            return Center(
              child: Container(
                width: 300,
                height: 400,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5.0,
                  shadowColor: Colors.blue[400],
                  color: Colors.grey[100],
                  child: Column(
                    children: [
                      if (viewModel.image == null)
                        Center(
                          child: Container(
                            width: 250,
                            height: 300,
                            margin: EdgeInsets.all(15.0),
                            padding: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 3.0,
                                color: Colors.grey,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 80,
                                  ),
                                  Icon(
                                    Icons.camera_alt_rounded,
                                    size: 40.0,
                                    color: cool,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "Upload today pic",
                                      style: TextStyle(
                                          color: cool,
                                          wordSpacing: 1.5,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (viewModel.image != null)
                        Container(
                          width: 250,
                          height: 300,
                          margin: EdgeInsets.all(15.0),
                          padding: EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3.0,
                              color: Colors.grey,
                            ),
                          ),
                          child: Image.file(
                            viewModel.image,
                            cacheWidth: 250,
                          ),
                        ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                        child: Center(
                          child: Row(
                            children: [
                              FlatButton(
                                child: Text(
                                  'Camera',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                                onPressed: () async {
                                  var image = await ImagePicker()
                                      .getImage(source: ImageSource.camera);
                                  if (image == null) return;
                                  viewModel.setImage(File(image.path));
                                },
                              ),
                              SizedBox(
                                width: 40.0,
                              ),
                              FlatButton(
                                child: Text(
                                  'Gallery',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                color: Colors.blueAccent,
                                textColor: Colors.white,
                                onPressed: () async {
                                  var image = await ImagePicker()
                                      .getImage(source: ImageSource.gallery);
                                  if (image == null) return;
                                  viewModel.setImage(File(image.path));
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomePageViewModel extends ChangeNotifier {
  var image;
  Future setImage(var file) async {
    this.image = file;
    this.notifyListeners();
  }
}
