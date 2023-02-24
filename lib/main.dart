import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:students_profile/controller/student_search_provider.dart';
import 'package:students_profile/database/functions/database_functions.dart';
import 'package:students_profile/database/model/data_model.dart';
import 'package:students_profile/screen/widgets/list_student.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: ((context) => ProviderStudentModel())),
        ListenableProvider(create: ((context) => SearchStudentProvider()))
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        home: ListStudents(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
