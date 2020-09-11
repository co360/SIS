class Student {
  int id;
  String firstName;
  String lastName;
  int grade;

  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student(String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.withoutInfo();

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
