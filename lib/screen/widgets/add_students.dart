import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:students_profile/database/functions/database_functions.dart';
import 'package:students_profile/database/model/data_model.dart';
import 'package:students_profile/screen/widgets/list_student.dart';

class add_Student extends StatefulWidget {
  const add_Student({super.key});

  @override
  State<add_Student> createState() => _add_StudentState();
}

class _add_StudentState extends State<add_Student> {
  final nameController = TextEditingController();

  final classController = TextEditingController();

  final phoneController = TextEditingController();

  final schoolController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Details")),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "Name",
                  icon: const Icon(Icons.person)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Name required";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: classController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "class",
                  icon: const Icon(Icons.class_)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Class required";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: phoneController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "phone",
                  icon: const Icon(Icons.phone)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Contact required";
                } else if (value.length != 10) {
                  return "Enter correct number";
                }
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: schoolController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: "School",
                  icon: const Icon(Icons.school)),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "School required";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 13,
            ),
            ElevatedButton.icon(
              onPressed: () {
                onAddStudentButtonCLicked();
                if (formKey.currentState!.validate()) {
                  // onAddStudentButtonCLicked();
                  Navigator.pop(context, MaterialPageRoute(builder: (ctx) {
                    return const List_students();
                  }));
                }
              },
              icon: const Icon(Icons.add),
              label: const Text("Add"),
            )
          ]),
        ),
      ),
    );
  }

  Future<void> onAddStudentButtonCLicked() async {
    final name = nameController.text.trim();
    final studentClass = classController.text.trim();
    final phone = phoneController.text.trim();
    final school = schoolController.text.trim();
    if (name.isEmpty ||
        studentClass.isEmpty ||
        phone.isEmpty ||
        school.isEmpty) {
      return;
    }

    final student = StudentModel(
        name: name, phone: phone, school: school, studentClass: studentClass);
    log('$name $phone $school $studentClass');
    addStudent(student);
  }
}
