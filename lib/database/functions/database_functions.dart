import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students_profile/database/model/data_model.dart';

class ProviderStudentModel with ChangeNotifier {
  List<StudentModel> studentList = [];

  List foundUser = [];

  void runFilter(String enteredKeyword) {
    List result = [];
    if (enteredKeyword.isEmpty) {
      result = studentList;
    } else {
      result = studentList
          .where((element) => element.name
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase().trim()))
          .toList();
    }
    foundUser = result;
    notifyListeners();
  }

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
