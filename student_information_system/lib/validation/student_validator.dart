class StudentValidationMixin {
  String validateFirstName(String value) {
    if (value.length < 2) {
      return "The name must have at least 2 characters.";
    }
  }

  String validateLastName(String value) {
    if (value.length < 2) {
      return "The surname must have at least 2 characters.";
    }
  }

  String validateGrade(String value) {
    var grade = int.parse(value);
    if (grade < 0 || grade > 100) {
      return "The grade must be between 0 and 100.";
    }
  }
}
