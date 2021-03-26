import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());


var selectedAvatar =     "https://icons.iconarchive.com/icons/hopstarter/superhero-avatar/256/Avengers-Captain-America-icon.png";

final List myAvatar = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG7XbqR8lp73VCY-IDTydmyLpiSCLF7dCy_Q&usqp=CAU",
  "https://iconarchive.com/download/i59025/hopstarter/superhero-avatar/Avengers-Iron-Man.ico",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYHwAOQLyySbuK-Ptq2pJUPBaO2ja7dF-L_A&usqp=CAU",
  "https://icons.iconarchive.com/icons/hopstarter/superhero-avatar/256/Avengers-Captain-America-icon.png"
];
const Color backGround = Color(0xFF092C28);
const Color circle_color = Color(0xFFAAC97B);

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.home_filled),
          onTap: () {},
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: ProfilePage(),
      backgroundColor: Colors.grey[200],
    ));
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Enter your name",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black54,
                          letterSpacing: 1.0)),
                  TextField(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 100,
                          height: 40,
                          color: backGround,
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.green,
                          )),
                      RaisedButton(
                          color: backGround,
                          child: Container(
                            width: 100,
                            height: 40,
                            child: Text("Save"),
                          ),
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: "Profile Updated",
                                toastLength: Toast.LENGTH_SHORT);
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()),
                            );
                          })
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        CustomPaint(
          size: Size.infinite,
          painter: DrawFig(),
        ),
        Positioned(
            top: _height * 0.12,
            left: _width * 0.10,
            child: Column(
              children: [
                Text(
                  "Sunshar Pichai",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.grey[200],
                      letterSpacing: 1.0),
                ),
                Text(
                  "sundharpichai@gmail.com",
                  style: TextStyle(color: Colors.grey[200], fontSize: 15),
                ),
              ],
            )),
        Positioned(
          top: _height * 0.15,
          right: _width * 0.15,
          child: Center(
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  selectedAvatar            ),
              radius: 50,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: _height * 0.35,
          child: Column(
            children: [
              MyListItem(
                icons: Icons.alternate_email,
                title: "username",
                subtitle: "Sundhar Pichai",
              ),
              MyListItem(
                icons: Icons.phone,
                title: "Phone",
                subtitle: "+91 9781388559",
              ),
              MyListItem(
                icons: Icons.email_outlined,
                title: "e-mail",
                subtitle: "SundharPichai@gmail.com",
              ),
              MyListItem(
                icons: Icons.leaderboard_rounded,
                title: "Position",
                subtitle: "2",
              ),
            ],
          ),
        ),
        Positioned(
            bottom: _height * 0.1,
            right: _width * 0.1,
            child: FloatingActionButton(
                backgroundColor: backGround,
                splashColor: backGround.withOpacity(0.2),
                tooltip: "Edit",
                child: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 500),
                          transitionsBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secAnimation,
                              Widget child) {
                            animation = CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeInToLinear);
                            return ScaleTransition(
                              scale: animation,
                              alignment: Alignment.center,
                              child: child,
                            );
                          },
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secAnimation) {
                            return EditScreen();
                          }));
                })),
      ],
    );
  }
}

class DrawFig extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..shader = ui.Gradient.linear(
          Offset(size.width * 0.20, size.height * 0.45),
          Offset(size.width * 0.50, size.height * 0.45),
          [backGround, backGround.withOpacity(0.9)]);
    var path = Path();
    path.lineTo(0, size.height * 0.20);
    path.lineTo(size.width * 0.20, size.height * 0.25);
    //Added this line
    path.relativeQuadraticBezierTo(47, 18, 100, -5);
    path.lineTo(size.width, size.height * 0.15);
    path.lineTo(size.width, 0);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MyListItem extends StatelessWidget {
  final IconData icons;
  final String title;
  final String subtitle;

  MyListItem({this.icons, this.title, this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 70,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                color: backGround,
                width: 70,
                height: 70,
                child: Icon(icons, color: Colors.white),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title),
                    Text(subtitle, style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phonePasswordController = TextEditingController();
  String username;
  String password;
  String email;
  String phonePassword;
  GlobalKey<FormState> editFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    usernameController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
    emailController.addListener(() {
      setState(() {});
    });
    phonePasswordController.addListener(() {
      setState(() {});
    });

    // );
  }
  //
  // final List myAvatar = [
  //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG7XbqR8lp73VCY-IDTydmyLpiSCLF7dCy_Q&usqp=CAU",
  //   "https://iconarchive.com/download/i59025/hopstarter/superhero-avatar/Avengers-Iron-Man.ico",
  //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYHwAOQLyySbuK-Ptq2pJUPBaO2ja7dF-L_A&usqp=CAU",
  //   "https://icons.iconarchive.com/icons/hopstarter/superhero-avatar/256/Avengers-Captain-America-icon.png"
  // ];

  Future<void> _showAvatars() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {

      return Padding(
          padding: const EdgeInsets.fromLTRB(0,300,0,0),
          child: Container(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: myAvatar.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return  Center(
                      child: GestureDetector(onTap: (){
                          selectedAvatar= myAvatar[index];

                          setState(() {
                          selectedAvatar= myAvatar[index];
                          Navigator.of(context).pop();
                        });},
                          child: Container(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              backgroundImage: NetworkImage(myAvatar[index]),
                              // child: Text(myAvatar[index]),
                              radius: 50,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                    )
                    ;
                  }),
            ),
        )

        ;
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {

         //   Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Container(
          child: Form(
            key: editFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.5,
                  child: Container(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showAvatars();
                          },
                          child: CircleAvatar(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                backgroundColor: Colors.yellow,
                                radius: 15.0,
                                child: Icon(
                                  Icons.edit,
                                  size: 15.0,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            backgroundImage: NetworkImage(
                                selectedAvatar),
                            radius: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                MyEditListItem(
                  controller: usernameController,
                  labelText: "Name",
                  icon: Icons.person_rounded,
                ),
                MyEditListItem(
                  controller: passwordController,
                  labelText: "Password",
                  icon: Icons.vpn_key,
                  validator: (String value) {
                    if (value.length < 4) {
                      return 'Please enter a password of atleast 4 characters';
                    }
                  },
                ),
                MyEditListItem(
                  controller: emailController,
                  labelText: "E-mail",
                  icon: Icons.email,
                  keyboard: TextInputType.emailAddress,
                  validator: (String value) {
                    if (value.contains("@")) {
                      return 'Please enter the valid id';
                    }
                  },
                ),
                MyEditListItem(
                  controller: phonePasswordController,
                  labelText: "Phone No.",
                  icon: Icons.phone,
                  keyboard: TextInputType.number,
                  validator: (String value) {
                    if (value.length >= 10) {
                      return 'Please enter a valid number';
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: BorderSide(color: backGround)),
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()),
                          );
                          Fluttertoast.showToast(
                              msg: "Profile not Updated",
                              toastLength: Toast.LENGTH_SHORT);
                        },
                        padding: EdgeInsets.all(10.0),
                        color: Colors.white,
                        textColor: backGround,
                        child: Text("Cancel", style: TextStyle(fontSize: 15)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 50.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: BorderSide(color: backGround)),
                        onPressed: () {
                          if (editFormKey.currentState.validate() == true) {
                            // Fluttertoast.showToast(msg: "Logged in!!",toastLength: Toast.LENGTH_SHORT);
                            username = phonePasswordController.text;
                            password = passwordController.text;
                            email = emailController.text;
                            phonePassword = phonePasswordController.text;
                          }
//Navigator.of(context).push(ProfilePage());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()),
                          );
                          Fluttertoast.showToast(
                              msg: "Profile not Updated",
                              toastLength: Toast.LENGTH_SHORT);
                        },
                        padding: EdgeInsets.all(10.0),
                        color: backGround,
                        textColor: Colors.white,
                        child: Text("Save", style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyEditListItem extends StatefulWidget {
  final IconData icon;
  final String validationMsg;
  final String validationCondition;
  final String labelText;
  final Function validator;
  final TextInputType keyboard;
  final TextEditingController controller;

  MyEditListItem(
      {this.icon,
      this.validationMsg,
      this.validationCondition,
      this.labelText,
      this.controller,
      this.validator,
      this.keyboard});

  @override
  _MyEditListItemState createState() => _MyEditListItemState();
}

class _MyEditListItemState extends State<MyEditListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Container(
        child: TextFormField(
          keyboardType: TextInputType.text,
          controller: widget.controller,
          validator: widget.validator,
          decoration: InputDecoration(
              labelText: widget.labelText,
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: Icon(widget.icon, color: backGround),
              enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color(0xFF29a329))),
              labelStyle: TextStyle(color: Color(0xFFbfbfbf))),
        ),
      ),
    );
  }
}
