// import 'package:bankai/main.dart';
// import 'package:bankai/screen2.dart';
import 'package:dkatalislabs/HomePage.dart';
import 'package:dkatalislabs/screen2.dart';
import 'package:flutter/material.dart';

import 'custom_widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<bool> _progressbarFlag = [true, false, false, false];
  // [lowercase, uppercase, number , characters]

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
          title: Text(
        "Create Account",
      )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              child: Stack(
                children: <Widget>[
                  ProgressBar(
                    offset: this._progressbarFlag,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " Create Password",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          " Password will be used to login",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(top: 20, bottom: 20, right: 10),
                  //   child: new TextFormField(
                  //     decoration: new InputDecoration(
                  //         hintText: "Create Password",
                  //         fillColor: Colors.white,
                  //         border: new OutlineInputBorder(
                  //           borderRadius: new BorderRadius.circular(25.0),
                  //         )),
                  //     validator: (String value) {
                  //       return value.contains("@") ? '@ is present' : 'not present';
                  //     },
                  //   ),
                  // ),
                  MyCustomForm1(true, true, true, true),

                  // Wrap(
                  //   children: <Widget>[
                  //     RectButton(label: "1",),
                  //     RectButton(label: "2",),
                  //     RectButton(label: "3",),

                  //   ],
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomForm1 extends StatefulWidget {
  bool lowerInd;
  bool upperInd;
  bool numInd;
  bool charInd;

  MyCustomForm1(this.lowerInd, this.upperInd, this.numInd, this.charInd);

  @override
  _MyCustomForm1State createState() => _MyCustomForm1State();
}

class _MyCustomForm1State extends State<MyCustomForm1> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidate: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: new TextFormField(
                decoration: new InputDecoration(
                    filled: true,
                    suffixIcon: Icon(Icons.remove_red_eye),
                    hintText: "Create Password",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    )),
                validator: (String value) {
                  //
                  Pattern pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                  RegExp regex = new RegExp(pattern);

                  // lowercase
                  bool lowercaseValid = RegExp(r'(?=.*[a-z])').hasMatch(value);
                  // uppercase
                  bool uppercaseValid = RegExp(r'(?=.*[A-Z])').hasMatch(value);
                  // Number
                  bool numValid = RegExp(r'(?=.*?[0-9])').hasMatch(value);
                  // Character
                  bool charlenValid = value.length > 9;

                  if (value.isEmpty) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        widget.charInd = true;
                        widget.lowerInd = true;
                        widget.upperInd = true;
                        widget.numInd = true;
                      });
                    });
                    return 'Please enter password';
                  } else if (charlenValid) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        widget.charInd = false;
                      });
                    });
                    return "";
                  } else if (lowercaseValid) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        widget.lowerInd = false;
                      });
                    });

                    return "";
                  } else if (uppercaseValid) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        widget.upperInd = false;
                      });
                    });

                    return "";
                  } else if (numValid) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        widget.numInd = false;
                      });
                    });

                    return "";
                  } else {
                    if (!regex.hasMatch(value))
                      return 'Enter valid password';
                    else
                      return null;
                  }
                }),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(
                  text: 'Complexity :',
                  // style: DefaultTextStyle.of(context).style,
                  style: TextStyle(color: Colors.white))),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                children: [
                  PasswordValidator(widget.lowerInd, "a"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Lowercase",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  PasswordValidator(widget.upperInd, "A"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Uppercase", style: TextStyle(color: Colors.white))
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  PasswordValidator(widget.numInd, "123"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Numbers", style: TextStyle(color: Colors.white))
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  PasswordValidator(widget.charInd, "9+"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Characters", style: TextStyle(color: Colors.white))
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130),
            child: CustomButton('Next', () {
              // if (_formKey.currentState.validate()) {

              // } else {
              //   print("--testing");
              // }
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  setState(() {
                    MyHomePage.progressbarFlag = [true, false, false, false];
                  });
                });

                return Screen2();
              }));
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Processing Data')));
            }),
          ),
        ],
      ),
    );
  }
}

class PasswordValidator extends StatefulWidget {
  final bool flag;
  final String label;

  PasswordValidator(this.flag, this.label);

  @override
  _PasswordValidatorState createState() => _PasswordValidatorState();
}

class _PasswordValidatorState extends State<PasswordValidator> {
  @override
  Widget build(BuildContext context) {
    return widget.flag
        ? getPasswordWidget(true, widget.label)
        : GreenIndicator();
  }
}

class GreenIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // border: Border.all(width: 0),
        borderRadius: BorderRadius.circular(50),
        color: Colors.lightGreen[700],
      ),
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }
}

class TextIndicator extends StatelessWidget {
  final String label;

  TextIndicator(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // border: Border.all(),
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
      ),
      child: Text(
        this.label,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

Widget getPasswordWidget(condition, label) {
  final bool condition = false;

  return condition ? GreenIndicator() : TextIndicator(label);
}
