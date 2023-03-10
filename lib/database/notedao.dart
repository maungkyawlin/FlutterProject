// dao/person_dao.dart

import 'package:floor/floor.dart';

import 'note_table.dart';

@dao
abstract class NoteDao {
  @Query('select * from note WHERE id = id')
  Stream<List<Note>> get getAllNotes;

  @insert
  Future<void> addNote(Note note);

  @delete
  Future<void> deleteNote(Note note);
  @update
  Future<void> updateNote(Note note);

  @delete
  Future<void> deleteAllNote(List<Note> notes);
}
