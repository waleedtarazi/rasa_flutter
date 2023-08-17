// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;
// class ImageDatabase {
//   static final ImageDatabase _instance = ImageDatabase._();

//   factory ImageDatabase() => _instance;

//   ImageDatabase._();

//   static Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     final directory = await getApplicationDocumentsDirectory();
//     final pathToDatabase = path.join(directory.path, 'image_database.db');
//     return await openDatabase(
//       pathToDatabase,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
//         CREATE TABLE images (
//           id INTEGER PRIMARY KEY,
//           imagePath TEXT
//         )
//       ''');
//       },
//     );
//   }

//   Future<int> insertImage(String imagePath) async {
//     final db = await database;
//     return await db.insert('images', {'imagePath': imagePath});
//   }

//   Future<List<String>> getAllImages() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query('images');
//     return List.generate(maps.length, (index) => maps[index]['imagePath']);
//   }
// }
