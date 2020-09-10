class Student {
  int id;
  String firstName;
  String lastname;
  int grade;
  String url;
  String _status;

  Student.withId(
      int id, String firstName, String lastName, int grade, String url) {
    this.id = id;
    this.firstName = firstName;
    this.lastname = lastName;
    this.grade = grade;
    this.url = url;
  }

  Student(String firstName, String lastName, int grade, String url) {
    this.firstName = firstName;
    this.lastname = lastName;
    this.grade = grade;
    this.url = url;
  }

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Passed";
    } else {
      message = "Failed";
    }
    return message;
  }
}
