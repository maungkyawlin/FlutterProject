import 'package:calendar/database/note_table.dart';
import 'package:calendar/database/notedao.dart';
import 'package:calendar/views/add_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Helper/notification.dart';
import '../Helper/theme_service.dart';

import '../utils/dimensions.dart';

import 'note_details.dart';
import 'search_page.dart';
import 'update_screen.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home(NoteDao noteDao, {super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic notifyHelper;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
    setState(() {
      print("I am Here");
    });
  }

  // ignore: use_key_in_widget_constructors
  final NoteDao noteDao = Get.find();

  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        width: MediaQuery.of(context).size.width / 3,
        child: Text(
          "Drawer",
          style: TextStyle(color: Get.isDarkMode ? Colors.black : Colors.white),
        ),
      ),
      //backgroundColor: Colors.blueGrey.withOpacity(0.7),
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.background,
        leading: GestureDetector(
          onTap: () {
            ThemeService().switchTheme();
            notifyHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode
                  ? "Activated Light Theme"
                  : "Activated  Dark Theme",
            );
            //notifyHelper.scheduledNotification();
          },
          child: Icon(
            Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
            size: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        titleSpacing: 1.5,
        title: Text(
          'Note ',
          style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => showSearch(
                  context: context,
                  delegate: SearchPage(
                    onQueryUpdate: print,
                    items: notes,
                    searchLabel: 'Search Note',
                    suggestion: const Center(
                      child: Text('Filter Note by title, message or id'),
                    ),
                    failure: const Center(
                      child: Text(' Note not found :('),
                    ),
                    filter: (notes) => [
                      notes.title,
                      notes.message,
                      notes.id.toString(),
                    ],
                    builder: (notes) => Card(
                      child: ListTile(
                        title: Text(notes.title),
                        subtitle: Text(
                          notes.message,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: OutlinedButton(
                          onPressed: () {
                            Get.to(const NoteDetailScreen(), arguments: notes);
                          },
                          child: Text('${notes.id} '),
                        ),
                        trailing: TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                          "Are you want to update this note? \n(OR) Are you sure to delete this note?"),
                                      content: const Text(
                                          "If you not sure to do both , click cancel to go back search!"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Get.to(UpdateScreen(),
                                                  arguments: notes);
                                            },
                                            child: const Text("Update")),
                                        TextButton(
                                            onPressed: () {
                                              noteDao.deleteNote(notes);
                                              Get.to(Home(noteDao));
                                            },
                                            child: const Text("Delete")),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("Cancel")),
                                      ],
                                    );
                                  });
                            },
                            child: const Icon(Icons.more_horiz)),
                      ),
                    ),
                  ),
                ),
                child: const Icon(Icons.search),
              ),
            ],
          )
        ],
      ),

      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(() => const AddScreen());
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    Text(
                      "Add",
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  _deleteAllNote(context);
                },
                child: Text(
                  'Delete All ',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: noteList(),
          ),
        ],
      ),
    );
  }

  Widget noteList() {
    return StreamBuilder<List<Note>>(
      stream: noteDao.getAllNotes,
      builder: (_, data) {
        if (data.hasData) {
          notes = data.data!;

          return ListView.builder(
            itemCount: data.data!.length,
            itemBuilder: (context, position) {
              return Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Card(
                  elevation: 8.0,
                  shadowColor: Colors.black,
                  child: ListTile(
                    title: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      data.data![position].title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      data.data![position].message,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    trailing: SizedBox(
                      width: Dimensions.listViewTextContainer,
                      child: Row(
                        children: [
                          Expanded(
                            child: IconButton(
                              onPressed: () {
                                Get.to(UpdateScreen(),
                                    arguments: data.data![position]);
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(
                                            "Are you sure to delete this note?"),
                                        content: const Text(
                                            "If you sure to delete , click delte button!"),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                noteDao.deleteNote(
                                                    data.data![position]);
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Delete")),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Cancel")),
                                        ],
                                      );
                                    });
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    minLeadingWidth: 5,
                    leading: IconButton(
                      onPressed: () {
                        Get.to(const NoteDetailScreen(),
                            arguments: data.data![position]);
                      },
                      icon: const Icon(
                        Icons.remove_red_eye,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (data.hasError) {
          return const Text('Error');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  void _deleteAllNote(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Are you sure to delete All Notes"),
          content:
              const Text('You sure click  delete if not sure  click cancel '),
          actions: [
            OutlinedButton(
              onPressed: () {
                noteDao.deleteAllNote(notes);
                Get.back();
              },
              child: const Text(
                "Delete",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        );
      },
    );
  }
}
