import 'package:calendar/database/note_database.dart';
import 'package:calendar/database/notedao.dart';
import 'package:calendar/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Helper/theme.dart';
import 'Helper/theme_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<NoteDatabase>(
        future: $FloorNoteDatabase.databaseBuilder('note.db').build(),
        builder: (context, data) {
          if (data.hasData) {
            Get.put(data.data!.noteDao);
            return Home(data.data!.noteDao);
          } else if (data.hasError) {
            return const Center(child: Text('Error'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
         
        },
      ),
    );
  }
}
