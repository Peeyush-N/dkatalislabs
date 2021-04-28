import 'package:flutter/material.dart';

import 'custom_widgets.dart';

class Screen3 extends StatefulWidget {
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
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
              height: 100,
              child: Stack(
                children: <Widget>[
                  ProgressBar(offset: [true, true, true, false]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,



                      children: [
                        CalenderGrow(),
                        SizedBox(
                          height: 20,
                        ),
                        // Padding(padding: const EdgeInsets.only(right: 10),

                        Text(
                          "Schedule Video Call ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        Text(
                          "Choose the data and time  that you preferred, we will send a link via email to make a video call on the scheduled date and time. ",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.white),
                        ),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, bottom: 20, right: 10),
                    child: Column(
                      children: [
                        DropDownClass("Date "),
                        // CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime(2001), lastDate: DateTime(2022), onDateChanged: null),
                        DropDownClass1("Time"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomButton('Next', () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return null;
                    }));
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CalenderGrow extends StatefulWidget {
  CalenderGrow({Key key}) : super(key: key);

  @override
  _CalenderGrowState createState() => _CalenderGrowState();
}

class _CalenderGrowState extends State<CalenderGrow> {
  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: new EdgeInsets.only(left: 20.0),
      height: sideLength,
      width: sideLength,
      duration: Duration(seconds: 2),
      curve: Curves.easeIn,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50.0),
          child: Container(
            padding: const EdgeInsets.only(left: 0),
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
            ),
            child: Icon(Icons.date_range),
          ),
          onTap: () {
            setState(() {
              sideLength == 50 ? sideLength = 100 : sideLength = 50;
            });
          },
        ),
      ),
    );
  }
}
