import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:laba_13/note_model.dart';

class DBHelper {
  Future<Database> initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, "note.db");
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT, date TEXT)',
        );
      },
    );
  }

  Future<int> createNote(NoteModel note) async {
    final Database db = await initDB();
    return db.insert('notes', note.toMap());
  }

  Future<List<NoteModel>> getNotes() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> result = await db.query(
      'notes',
      orderBy: 'date DESC',
    );
    return result.map((e) => NoteModel.fromMap(e)).toList();
  }

}
