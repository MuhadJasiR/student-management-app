// import 'package:flutter/material.dart';
// import 'package:students_profile/database/functions/database_functions.dart';
// import 'package:students_profile/database/model/data_model.dart';
// import 'package:students_profile/screen/widgets/displaystudent.dart';

// class Search extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return <Widget>[
//       IconButton(
//         onPressed: () {
//           query = "";
//         },
//         icon: const Icon(Icons.clear),
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, query);
//         },
//         icon: const Icon(Icons.arrow_back));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: studentListNotifier,
//       builder:
//           (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
//         return ListView.builder(
//           itemBuilder: (ctx, index) {
//             final data = studentList[index];
//             if (data.name.toLowerCase().contains(query.toLowerCase())) {
//               return Column(
//                 children: [
//                   ListTile(
//                     onTap: () {
//                       Navigator.of(ctx).push(
//                         MaterialPageRoute(
//                           builder: (context) => DisplayScreen(
//                             name: data.name,
//                             studentClass: data.studentClass,
//                             index: index,
//                             school: data.school,
//                             phone: data.phone,
//                           ),
//                         ),
//                       );
//                     },
//                     title: Text(data.name),
//                     leading: const CircleAvatar(
//                         radius: 30,
//                         backgroundImage: NetworkImage(
//                             "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80")),
//                   ),
//                   const Divider(),
//                 ],
//               );
//             } else {
//               return Container();
//             }
//           },
//           itemCount: studentList.length,
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: studentListNotifier,
//       builder:
//           (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
//         return ListView.builder(
//           itemBuilder: (ctx, index) {
//             final data = studentList[index];
//             if (data.name.toLowerCase().contains(query.toLowerCase())) {
//               return Column(
//                 children: [
//                   ListTile(
//                     onTap: () {
//                       Navigator.of(ctx).push(
//                         MaterialPageRoute(
//                           builder: (context) => DisplayScreen(
//                             name: data.name,
//                             studentClass: data.studentClass,
//                             index: index,
//                             school: data.school,
//                             phone: data.phone,
//                           ),
//                         ),
//                       );
//                     },
//                     title: Text(data.name),
//                     leading: const CircleAvatar(
//                         radius: 30,
//                         backgroundImage: NetworkImage(
//                             "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80")),
//                   ),
//                   const Divider(),
//                 ],
//               );
//             } else {
//               return Container();
//             }
//           },
//           itemCount: studentList.length,
//         );
//       },
//     );
//   }
// }
