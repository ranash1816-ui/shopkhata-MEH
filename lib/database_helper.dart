import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('shopkhata.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE customers (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      phone TEXT,
      address TEXT,
      total_due REAL DEFAULT 0.0
    )
    ''');

    await db.execute('''
    CREATE TABLE transactions (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      customer_id INTEGER,
      type TEXT NOT NULL,
      amount REAL NOT NULL,
      paid REAL NOT NULL,
      due REAL NOT NULL,
      date TEXT NOT NULL,
      description TEXT,
      FOREIGN KEY (customer_id) REFERENCES customers (id)
    )
    ''');
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}
