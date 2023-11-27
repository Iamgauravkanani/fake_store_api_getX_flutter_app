class Student {
  int? id;
  String name;
  String course;

  Student({required this.course, required this.name, this.id});

  factory Student.fromSQL({required Map data}) {
    return Student(
      course: data['course'],
      name: data['name'],
      id: data['id'],
    );
  }
}
