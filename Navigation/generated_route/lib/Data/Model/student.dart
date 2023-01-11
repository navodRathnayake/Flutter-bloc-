library student_model;

class Student {
  final String firstName;
  final String lastName;
  final int age;

  const Student(
      {required this.firstName, required this.lastName, required this.age});

  Student copyWith(
      {String? studentFirstName, String? studentLastName, int? studentAge}) {
    return Student(
      firstName: studentFirstName ??= firstName,
      lastName: studentLastName ??= lastName,
      age: studentAge ??= age,
    );
  }

  String get getFirstName => firstName;
  String get getLastName => lastName;
  int get getAge => age;

  Student.fromJson({required Map<String, dynamic> json})
      : firstName = json['firstName']!,
        lastName = json['lastName']!,
        age = json['age']!;

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
    };
  }

  @override
  String toString() {
    return """
{
  firstName : $firstName,
  lastName : $lastName,
  age : $age,
}""";
  }
}
