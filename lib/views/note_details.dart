import 'package:calendar/database/note_table.dart';
import 'package:calendar/database/notedao.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/dimensions.dart';

// ignore: must_be_immutable
class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NoteDao noteDao = Get.find();
    Note note = Get.arguments;
    int id;

    return Scaffold(
      //backgroundColor: Colors.blueGrey.withOpacity(0.7),
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.background,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          children: [
            Text(
              "Note App/ Note Details/",
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${note.id}",
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Dimensions.height10,
                ),
                Text(
                  note.title,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: Dimensions.height15,
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.justify,
                    note.message,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
