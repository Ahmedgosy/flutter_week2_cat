import 'dart:io';
import 'dart:math';

void main() {
  Map<String, double> studentGrades = {};

  // Input student names and grades
  while (true) {
    stdout.write("Enter student name (or 'done' to finish): ");
    String? name = stdin.readLineSync();

    if (name == null || name.toLowerCase() == 'done') {
      break;
    }

    double? grade;
    while (grade == null) {
      stdout.write("Enter ${name}'s grade: ");
      String? gradeStr = stdin.readLineSync();
      if (gradeStr == null) {
        print("Invalid input. Please enter a grade.");
        continue;
      }
      try {
        grade = double.parse(gradeStr);
        if (grade < 0) {
          print("Grade cannot be negative. Please enter a valid grade.");
          grade = null; // Reset grade to re-enter
        }
      } catch (e) {
        print("Invalid grade format. Please enter a numeric grade.");
        grade = null; // Reset grade to re-enter
      }
    }
    studentGrades[name] = grade;
  }

  if (studentGrades.isEmpty) {
    print("\nNo student data entered.");
    return;
  }

  // Calculate statistics
  double highestGrade = -double.infinity;
  double lowestGrade = double.infinity;
  double sumGrades = 0;

  studentGrades.forEach((name, grade) {
    highestGrade = max(highestGrade, grade);
    lowestGrade = min(lowestGrade, grade);
    sumGrades += grade;
  });

  double averageGrade = sumGrades / studentGrades.length;

  String highestGradeStudent = "";
  String lowestGradeStudent = "";

  studentGrades.forEach((name, grade) {
    if (grade == highestGrade) {
      highestGradeStudent = name; // If multiple have highest, will take the last one iterated
    }
    if (grade == lowestGrade) {
      lowestGradeStudent = name; // If multiple have lowest, will take the last one iterated
    }
  });

  // Sort grades high to low
  List<MapEntry<String, double>> sortedGradesList = studentGrades.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  Set<String> sortedGradesSet = sortedGradesList.map((entry) => "${entry.key} (${entry.value})").toSet();


  // Above average students
  List<String> aboveAverageStudents = [];
  studentGrades.forEach((name, grade) {
    if (grade > averageGrade) {
      aboveAverageStudents.add(name);
    }
  });

  // Display Results
  print("\nResults:");
  print("Highest Grade: ${highestGrade.toStringAsFixed(0)} (${highestGradeStudent})");
  print("Lowest Grade: ${lowestGrade.toStringAsFixed(0)} (${lowestGradeStudent})");
  print("Average Grade: ${averageGrade.toStringAsFixed(1)}");
  print("Sorted Grades (High to Low): {${sortedGradesSet.join(', ')}}");
  print("Above Average Students: ${aboveAverageStudents.join(', ')}");
}