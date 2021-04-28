// import 'package:bankai/screen3.dart';
import 'package:dkatalislabs/screen3.dart';
import 'package:flutter/material.dart';

import 'custom_widgets.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  List<bool> _progressbarFlag = [true, true, false, false];

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
                  ProgressBar(offset: this._progressbarFlag),
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
                        Text("Personal Information",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                        Text(
                            "Please fill in the information below and you goal for digital saving",
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.white)),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 20, right: 10),
                          child: Column(
                            children: [
                              DropDownClass("Goal for Activation"),
                              DropDownClass("Monthly Income"),
                              DropDownClass("Monthly Expense")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 1,
                  ),
                  
                  CustomButton('Next', () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      //   WidgetsBinding.instance.addPostFrameCallback((_) {
                      //   setState(() {
                      //     print(" screen 2 working");
                      //     _progressbarFlag = [true, true, true, false];

                      //   });
                      // });
                      return Screen3();
                    }));
                  }),
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
