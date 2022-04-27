class Employee {
  late String id;
  late String name;
  late int age;
  late double salary;
  Employee(
      {required this.id,
      required this.name,
      required this.age,
      required this.salary});
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'salary': salary,
      };
  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      salary: json['salary']);
}
