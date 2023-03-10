import 'package:floor/floor.dart';

@Entity(tableName: 'note')
class Note {
  @primaryKey
  final int? id;

  String title;
  String message;
  
  Note(this.title, this.message, {this.id});


}
