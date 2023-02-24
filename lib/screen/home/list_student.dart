import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:students_profile/controller/core/constraints.dart';
import 'package:students_profile/database/functions/database_functions.dart';
import 'package:students_profile/screen/addstudent/add_students.dart';
import 'package:students_profile/screen/studentDetails/displaystudent.dart';

class ListStudents extends StatelessWidget {
  const ListStudents({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<ProviderStudentModel>(context, listen: false)
            .getAllStudents();
        Provider.of<ProviderStudentModel>(context, listen: false).foundUser =
            Provider.of<ProviderStudentModel>(context, listen: false)
                .studentList;
      },
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text("Student Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 45,
                child: CupertinoSearchTextField(
                  onChanged: ((value) =>
                      Provider.of<ProviderStudentModel>(context, listen: false)
                          .runFilter(value)),
                ),
              ),
              kHeight20,
              Expanded(child: Consumer<ProviderStudentModel>(
                  builder: ((context, value, child) {
                return value.foundUser.isNotEmpty
                    ? ListView.separated(
                        itemBuilder: (ctx, index) {
                          final data = value.foundUser[index];
                          return Card(
                            elevation: 10,
                            child: ListTile(
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
                              trailing: SizedBox(
                                width: 70,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: ((context) {
                                                return AlertDialog(
                                                  content: const Text(
                                                      "Are sure to delete"),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                            const Text("NO")),
                                                    TextButton(
                                                        onPressed: () {
                                                          value.deleteStudent(
                                                              index);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child:
                                                            const Text("YES"))
                                                  ],
                                                );
                                              }));
                                        },
                                        icon: const Icon(
                                          Icons.delete_outline,
                                          color: Colors.red,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (ctx, index) {
                          return const Divider();
                        },
                        itemCount: value.foundUser.length)
                    : Center(
                        child: Image.asset(
                          "asset/13659-no-data (1).gif",
                          width: 230,
                        ),
                      );
              }))),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx) {
              return add_Student();
            }));
          },
          label: const Text("ADD Student"),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
