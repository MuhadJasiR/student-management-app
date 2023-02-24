import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students_profile/controller/core/constraints.dart';
import 'package:students_profile/database/functions/database_functions.dart';
import 'package:students_profile/database/model/data_model.dart';
import 'package:students_profile/screen/home/list_student.dart';

class EditScreen extends StatelessWidget {
  const EditScreen(
      {super.key,
      required this.name,
      required this.studentClass,
      required this.phone,
      required this.school,
      required this.index});
  final String name;
  final String studentClass;
  final String phone;
  final String school;
  final int index;
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: name);
    final classController = TextEditingController(text: studentClass);
    final phoneController = TextEditingController(text: phone);
    final schoolController = TextEditingController(text: school);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Student"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Name",
                  border: OutlineInputBorder(),
                  hintText: "Edit name"),
            ),
            kHeight15,
            TextFormField(
              controller: classController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.book),
                  border: OutlineInputBorder(),
                  hintText: "Edit Class",
                  labelText: "Class"),
            ),
            kHeight15,
            TextFormField(
              keyboardType: TextInputType.number,
              controller: phoneController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                  hintText: "Edit Phone number",
                  labelText: "Phone"),
            ),
            kHeight15,
            TextFormField(
              controller: schoolController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.school),
                  border: OutlineInputBorder(),
                  hintText: "Edit School",
                  labelText: "School"),
            ),
            kHeight15,
            ElevatedButton.icon(
                onPressed: () {
                  StudentModel newDetails = StudentModel(
                      id: index,
                      name: nameController.text,
                      phone: phoneController.text,
                      school: schoolController.text,
                      studentClass: schoolController.text);
                  Provider.of<ProviderStudentModel>(context, listen: false)
                      .updateStudentModel(index, newDetails);
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return const ListStudents();
                  }));

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Student Data Updated"),
                    backgroundColor: Colors.purple,
                    duration: Duration(seconds: 1),
                  ));
                },
                icon: const Icon(Icons.done_all_rounded),
                label: const Text("Done"))
          ],
        ),
      ),
    );
  }
}
