import 'package:flutter/material.dart';
import 'package:student_information_system/models/student.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Student selectedStudent = Student.withId(0, "", "", 0, "");

  List<Student> students = [
    Student.withId(1, "Ali", "Aydın", 45,
        "https://cdn.pixabay.com/photo/2014/09/17/11/47/man-449406__340.jpg"),
    Student.withId(2, "Ayse", "Yılmaz", 90,
        "https://cdn.pixabay.com/photo/2016/10/19/14/03/model-1753032__340.jpg"),
    Student.withId(3, "Mustafa", "Deniz", 70,
        "https://cdn.pixabay.com/photo/2016/01/05/11/36/portrait-1122364__340.jpg")
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

  void displayMessage(BuildContext context, String message) {
    var alert = AlertDialog(
      title: Text("Operation Result"),
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
                    subtitle: Text("Exam grade: " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                      print(selectedStudent.firstName +
                          " " +
                          selectedStudent.lastname);
                    },
                  );
                })),
        Text("Selected student is: " +
            selectedStudent.firstName +
            " " +
            selectedStudent.lastname),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                  color: Colors.blueAccent,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Add"),
                    ],
                  ),
                  onPressed: () {
                    var message = "Student is added.";
                    displayMessage(context, message);
                  }),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                  color: Colors.yellowAccent,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.update),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Update"),
                    ],
                  ),
                  onPressed: () {
                    var message = "Student is updated.";
                    displayMessage(context, message);
                  }),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                  color: Colors.redAccent,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.delete),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Delete"),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      students.remove(selectedStudent);
                    });
                    var message = "Student is deleted.";
                    displayMessage(context, message);
                  }),
            )
          ],
        )
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
