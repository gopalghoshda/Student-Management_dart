// Define the abstract Role interface
abstract class Role {
  void displayRole();
}

// Define the Person class implementing Role
class Person implements Role {
  final String name;
  final int age;
  final String address;

  Person(this.name, this.age, this.address);

  @override
  void displayRole() {
    // Default implementation (can be overridden by subclasses)
    print("Role: Undefined");
  }
}

// Define the Student class extending Person
class Student extends Person {
  final String studentID;
  final String grade;
  final List<double> courseScores;

  Student(String name, int age, String address, this.studentID, this.grade, this.courseScores)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    double total = courseScores.fold(0, (sum, score) => sum + score);
    return total / courseScores.length;
  }
}

// Define the Teacher class extending Person
class Teacher extends Person {
  final String teacherID;
  final List<String> coursesTaught;

  Teacher(String name, int age, String address, this.teacherID, this.coursesTaught)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayCoursesTaught() {
    print("Courses Taught:");
    for (var course in coursesTaught) {
      print("- $course");
    }
  }
}

// Define the StudentManagementSystem
void main() {
  // Create a Student instance
  Student student = Student(
    "John Doe",
    20,
    "123 Main St",
    "S123",
    "A",
    [90, 85, 82],
  );

  // Create a Teacher instance
  Teacher teacher = Teacher(
    "Mrs. Smith",
    35,
    "456 Oak St",
    "T456",
    ["Math", "English", "Bangla"],
  );

  // Display Student Information
  print("Student Information:");
  student.displayRole();
  print("Name: ${student.name}");
  print("Age: ${student.age}");
  print("Address: ${student.address}");
  print("Average Score: ${student.calculateAverageScore()}");

  print("\n");

  // Display Teacher Information
  print("Teacher Information:");
  teacher.displayRole();
  print("Name: ${teacher.name}");
  print("Age: ${teacher.age}");
  print("Address: ${teacher.address}");
  teacher.displayCoursesTaught();
}
