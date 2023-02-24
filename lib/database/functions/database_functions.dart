import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students_profile/database/model/data_model.dart';

// ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

class ProviderStudentModel with ChangeNotifier {
  List<StudentModel> studentList = [];

  Future<void> addStudent(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>("student_db");
    final id = await studentDB.add(value);
    value.id = id;
    studentList.add(value);
    notifyListeners();
  }

  Future<void> getAllStudents() async {
    final studentDB = await Hive.openBox<StudentModel>("student_db");
    studentList.clear();
    studentList.addAll(studentDB.values);
    notifyListeners();
  }

  Future<void> deleteStudent(int id) async {
    final studentDB = await Hive.openBox<StudentModel>("student_db");
    await studentDB.deleteAt(id);
    getAllStudents();
  }

  Future<void> updateStudentModel(int id, StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>("student_db");
    await studentDB.putAt(id, value);

    getAllStudents();
  }
}
