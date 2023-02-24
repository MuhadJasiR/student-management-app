import 'package:flutter/foundation.dart';
import 'package:students_profile/database/functions/database_functions.dart';
import 'package:students_profile/database/model/data_model.dart';

class SearchStudentProvider with ChangeNotifier {
  List<StudentModel> foundUser = [];

  void runFilter(String enteredKeyword) {}
}
