import 'package:flutter/material.dart';
import 'package:students_profile/database/model/data_model.dart';
import 'package:students_profile/screen/widgets/edit_student.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen(
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
    return Scaffold(
        appBar: AppBar(
          title: const Text("Student Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80"),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Name      : $name",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Class        : $studentClass",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Contacts  :$phone",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "School      :$school",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return EditScreen(
                          name: name,
                          studentClass: studentClass,
                          phone: phone,
                          school: school,
                          index: index);
                    })));
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text("Edit"))
            ],
          ),
        ));
  }
}
