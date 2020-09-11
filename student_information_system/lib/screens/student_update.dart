import 'package:flutter/material.dart';
import 'package:student_information_system/models/student.dart';
import 'package:student_information_system/validation/student_validator.dart';

class StudentUpdate extends StatefulWidget {
  Student selectedStudent;

  StudentUpdate(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  Student selectedStudent;

  var formKey = GlobalKey<FormState>();

  _StudentAddState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adding New Student"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton(),
              ],
            )),
      ),
    );
  }

  TextFormField buildFirstNameField() {
    return TextFormField(
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(
          labelText: "Name", hintText: "Please enter your name"),
      validator: validateFirstName,
      onSaved: (String value) {
        selectedStudent.firstName = value;
      },
    );
  }

  TextFormField buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration: InputDecoration(
          labelText: "Surname", hintText: "Please enter surname"),
      validator: validateLastName,
      onSaved: (String value) {
        selectedStudent.lastName = value;
      },
    );
  }

  TextFormField buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration:
          InputDecoration(labelText: "Grade", hintText: "Please enter grade"),
      validator: validateGrade,
      onSaved: (String value) {
        selectedStudent.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("SUBMIT"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }
}
