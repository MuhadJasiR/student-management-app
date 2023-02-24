import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: double.infinity,
            height: 600,
            child: Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80"),
                  ),
                  Text(
                    "Name: $name",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    "School:$school",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Class:$studentClass",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Contacts  :$phone",
                    style: const TextStyle(fontSize: 20),
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
            ),
          ),
        ));
  }
}
