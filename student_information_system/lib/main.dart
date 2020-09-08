import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var students = ["Ali Yılmaz", "Ayse Sahin", "Ceren Uslu"];
    return Scaffold(
        appBar: AppBar(
          title: Text("Student Information System"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(students[index]);
                    })),
            Center(
              child: RaisedButton(
                  child: Text("Click for Exam Result"),
                  onPressed: () {
                    var message = displayExamResult(30);
                    displayMessage(context, message);
                  }),
            ),
          ],
        ));
  }

  String displayExamResult(int score) {
    String message = "";
    if (score >= 50) {
      message = "You passed";
    } else {
      message = "You did not passed";
    }
    return message;
  }

  void displayMessage(BuildContext context, String message) {
    var alert = AlertDialog(
      title: Text("Exam Result"),
      content: Text(message),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
