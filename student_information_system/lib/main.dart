import 'package:flutter/material.dart';
import 'package:student_information_system/models/student.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  List<Student> students = [
    Student("Ali", "Aydın", 45,
        "https://cdn.pixabay.com/photo/2014/09/17/11/47/man-449406__340.jpg"),
    Student("Ayse", "Yılmaz", 90,
        "https://cdn.pixabay.com/photo/2016/10/19/14/03/model-1753032__340.jpg")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Information System"),
      ),
      body: buildBody(context),
    );
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
      title: Text("Exam Result!"),
      content: Text(message),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(students[index].url),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastname),
                    subtitle:
                        Text("Exam grade: " + students[index].grade.toString()),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      print(students[index].firstName +
                          " " +
                          students[index].lastname);
                    },
                  );
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
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else {
      return Icon(Icons.clear);
    }
  }
}
