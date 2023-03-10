import 'package:calendar/database/note_table.dart';
import 'package:calendar/database/notedao.dart';
import 'package:calendar/utils/dimensions.dart';
import 'package:calendar/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class UpdateScreen extends StatelessWidget {
  UpdateScreen({Key? key}) : super(key: key);
  TextEditingController title = TextEditingController();
  TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final NoteDao noteDao = Get.find();

    Note note =Get.arguments;
    
    title.text = note.title;
    message.text = note.message;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.background,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            )),
        title: Text(
          "Update Note",
          style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(Dimensions.height10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " Update Note",
              style: TextStyle(
                fontSize: Dimensions.font20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            TextField(
              maxLines: 2,
              minLines: 1,
              controller: title,
              style: TextStyle(
                fontSize: Dimensions.font20,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                labelText: "Title",
                border: const OutlineInputBorder(//borderSide: BorderSide.none
                    ),
                hintText: "Title",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            TextField(
              minLines: 4,
              maxLines: 4,
              controller: message,
              style: TextStyle(
                fontSize: Dimensions.font20,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Message",
                hintText: "Message",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            OutlinedButton(
              onPressed: () {
                noteDao.updateNote(Note(
                  title.text,
                  message.text,
                  id: note.id,
                ));
                Get.to(Home(noteDao));
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(
                    left: Dimensions.height30,
                    right: Dimensions.height30,
                    top: Dimensions.height30,
                    bottom: Dimensions.height20),
                shadowColor: Colors.black,
                // backgroundColor: Colors.blue,
              ),
              child: const Text('Update'),
            )
          ],
        ),
      ),
    );
  }
}
