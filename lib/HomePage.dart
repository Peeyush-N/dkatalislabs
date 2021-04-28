import 'dart:ffi';

import 'package:dkatalislabs/login.dart';
import 'package:flutter/material.dart';
import 'custom_widgets.dart';

class MyHomePage extends StatefulWidget {
  static List<bool> progressbarFlag = [false, false, false, false];
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title : Text("Home")),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  child: CustomPaint(
                    painter: Chevron(),
                    child: Container(height: 220),
                  ),
                ),
                ProgressBar(
                  offset: MyHomePage.progressbarFlag,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RichText(
                            textScaleFactor: 0.8,
                            text: TextSpan(
                              // text: 'Welcome to ',
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Wecome to                ',
                                  style: TextStyle(
                                      fontFamily: 'Raleway',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                                TextSpan(
                                  text: ' GIN',
                                  style: TextStyle(
                                      fontFamily: 'Raleway',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                                TextSpan(
                                  text: ' Finans',
                                  style: TextStyle(
                                      fontFamily: 'Raleway',
                                      color: Colors.lightBlueAccent,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: Text(
                              "Welcome to The Bank of The Future . Manage and track your account on the go. ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal),
                            ),
                          ),
                        ]),
                  ),
                  MyCustomForm(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScreenOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen one ")),
      body: Container(
          child: Text(
        " Get the digital mapping of your field done!",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
      )),
    );
  }
}

class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen two( Digital Mapping)")),
      body: Container(
          child: Text(
        " Get the digital mapping of your field done!",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
      )),
    );
  }
}

class ScreenThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen two( Digital Mapping)")),
      body: Container(
          child: Text(
        " Get the digital mapping of your field done!",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
      )),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always,
      key: _formKey,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: new TextFormField(
                decoration: new InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    // icon: Icon(Icons.email),
                    hintText: "Enter your email",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                        // borderRadius: new BorderRadius.circular(25.0),
                        )),
                validator: (String value) {
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  return emailValid ? null : 'Please provide valid email';
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 110),
                child: CustomButton('Next', () {
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        setState(() {
                          MyHomePage.progressbarFlag = [
                            false,
                            false,
                            false,
                            false
                          ];
                        });
                      });

                      return Login();
                    }));
                  } else {
                    // Scaffold.of(context)
                    //     .showSnackBar(SnackBar(content: Text('Processing Data')));
                  }
                }),
              ),
            ),
          ]),
    );
  }
}

class Chevron extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.blue, Colors.lightBlueAccent],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = new Paint()
      ..shader = gradient.createShader(colorBounds);

    Path path = Path();
    path.lineTo(0.0, size.height - 40);
    // path.lineTo(size.width, 0.0);
    // path.lineTo(size.width, size.height - 100);
    // path.close();
    // path.moveTo(1, 0);
    // path.lineTo(0, size.height);
    // path.lineTo(size.width / 10, size.height - size.height / 3);
    path.quadraticBezierTo(
        size.width / 12, size.height / 12, size.width, size.height);
    // path.quadraticBezierTo(
    // size.width / 12, size.height, size.width, size.height * 0);
    // path.lineTo(size.width / 10, size.height - size.height / 3);
    // path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
