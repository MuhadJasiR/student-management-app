import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final String studentClass;

  @HiveField(4)
  final String school;

  StudentModel(
      {required this.name,
      required this.phone,
      required this.school,
      required this.studentClass,
      this.id});
}
