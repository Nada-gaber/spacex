import 'package:path/path.dart';
import 'package:spacex/features/saved_items/data/models/saved_item.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static Database? _db;

  static const String databaseName = "saved_items.db";
  static const String tableName = "saved";

  get db async {
    if (_db == null) {
      String path = join(await getDatabasesPath(), databaseName);
      _db = await openDatabase(path,
          version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
      return _db;
    }
    return _db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        type TEXT NOT NULL,
        image TEXT NOT NULL,
        location TEXT NOT NULL
        )
''');
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('drop table $tableName');
    await _onCreate(db, newVersion);
  }

  Future<SavedItemModel> saveItem(SavedItemModel item) async {
    Database clint = await db;
    int record = await clint.insert(tableName, {
      'id': item.id,
      'title': item.title,
      'type': item.type,
      'image': item.imageUrl,
      'location': item.country,
    });
    item.id = record;
    return item;
  }

  Future<List<SavedItemModel>> getSavedItems() async {
    Database clint = await db;
    List<Map> savedItems = await clint.query(tableName,
        columns: ["id", "title", "image", "location", "type"]);
    List<SavedItemModel> allItems = [];
    if (savedItems.isNotEmpty) {
      for (int i = 0; i < savedItems.length; i++) {
        SavedItemModel s = SavedItemModel(
          id: savedItems[i]['id'],
          title: savedItems[i]['title'],
          imageUrl: savedItems[i]['image'],
          country: savedItems[i]['location'],
          type: savedItems[i]['type'],
        );
        allItems.add(s);
      }
    }
    return allItems;
  }

  Future<bool> isSaved(String itemTitle) async {
    Database clint = await db;
    List<Map<String, dynamic>> items = await clint.query(
      tableName,
      where: "title = ?",
      whereArgs: [itemTitle],
    );
    return items.isNotEmpty;
  }

  Future<int> delete(String title) async {
    Database clint = await db;
    Future<int> numOfRecord =
    clint.delete(tableName, where: "title=?", whereArgs: [title]);
    return numOfRecord;
  }

}
