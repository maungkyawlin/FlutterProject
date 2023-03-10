import 'package:calendar/database/note_table.dart';
import 'package:calendar/database/notedao.dart';
import 'package:calendar/utils/dimensions.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController title = TextEditingController();

  TextEditingController message = TextEditingController();

  dynamic _userTitle;
  dynamic _userMessage;

  @override
  Widget build(BuildContext context) {
    final NoteDao noteDao = Get.find();
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
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
        title: Text(
          "Create Note",
          style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
      ),
      body: Container(
        width: screen.width,
        height: screen.height / 2,
        margin: EdgeInsets.all(Dimensions.height10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add Note",
                style: TextStyle(
                  fontSize: Dimensions.font26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              TextFormField(
                controller: title,
                style: TextStyle(
                    fontSize: Dimensions.font20, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  errorText: _userTitle,
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    fontSize: Dimensions.font20,
                    fontWeight: FontWeight.bold,
                  ),
                  border: const OutlineInputBorder(),
                  hintText: "Title",
                  suffixIcon: const Icon(
                    Icons.text_format,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _userTitle == null;
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    _userTitle = "Title is required";
                    setState(() {});
                  }
                  return null;
                },
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              TextFormField(
                minLines: 2,
                maxLines: 2,
                controller: message,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _userMessage == null;
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    _userMessage = "Message is required";
                    setState(() {});
                  } else {
                    noteDao.addNote(Note(
                      title.text,
                      message.text,
                    ));
                    Get.back();
                  }
                  return null;
                },
                style: TextStyle(
                    fontSize: Dimensions.font20, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  errorText: _userMessage,
                  labelText: 'Message',
                  labelStyle: TextStyle(
                    fontSize: Dimensions.font20,
                    fontWeight: FontWeight.bold,
                  ),
                  border: const OutlineInputBorder(),
                  hintText: "Message",
                  suffixIcon: const Icon(
                    Icons.email,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              Row(
                // mainAxisSize:MainAxisSize.max,
                // verticalDirection: VerticalDirection.down,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _scaffoldKey.currentState?.setState(() {});

                      } else {
                        Get.back();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                          left: Dimensions.height30,
                          right: Dimensions.height15,
                          top: Dimensions.height20,
                          bottom: Dimensions.height20),
                      shadowColor: Colors.black,
                      // backgroundColor: Colors.blue,
                    ),
                    child: const Text('Save '),
                  ),
                  SizedBox(
                    width: Dimensions.height10,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Get.to(const AddScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.only(
                          left: Dimensions.height20,
                          right: Dimensions.height20,
                          top: Dimensions.height20,
                          bottom: Dimensions.height20),
                      shadowColor: Colors.black,

                      // backgroundColor: Colors.blue,
                    ),
                    child: const Text('Cancel'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
