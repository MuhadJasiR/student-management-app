import 'package:flutter/material.dart';
import 'package:students_profile/database/functions/database_functions.dart';
import 'package:students_profile/database/model/data_model.dart';
import 'package:students_profile/screen/widgets/add_students.dart';
import 'package:students_profile/screen/widgets/displaystudent.dart';
import 'package:students_profile/screen/widgets/search_student.dart';

class List_students extends StatelessWidget {
  const List_students({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Student"),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Search());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: studentListNotifier,
                  builder: (BuildContext ctx, List<StudentModel> studentList,
                      Widget? child) {
                    return ListView.separated(
                        itemBuilder: (ctx, index) {
                          final data = studentList[index];
                          return ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80"),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DisplayScreen(
                                    name: data.name,
                                    studentClass: data.studentClass,
                                    phone: data.phone,
                                    school: data.school,
                                    index: index);
                              }));
                            },
                            title: Text(data.name),
                            subtitle: Text(data.school),
                            trailing: Container(
                              width: 70,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        deleteStudent(index);
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (ctx, index) {
                          return const Divider();
                        },
                        itemCount: studentList.length);
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx) {
              return const add_Student();
            }));
          },
          label: const Text("ADD Student"),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
