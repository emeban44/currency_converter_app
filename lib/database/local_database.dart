// import 'package:currency_converter_app/models/local_currency.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class LocalDatabase {
//   static final LocalDatabase instance = LocalDatabase._init();

//   static Database _database;

//   LocalDatabase._init();

//   Future<Database> get database async {
//     if (database != null) return _database;

//     _database = await _initDB('currencies.db');
//     return _database;
//   }

//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);

//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }

//   Future _createDB(Database db, int version) async {
//     final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
//     final boolType = 'BOOLEAN NOT NULL';
//     final textType = 'TEXT NOT NULL';
//     final intType = 'INTEGER NOT NULL';

//     await db.execute('''
//     CREATE TABLE $tableCurrencies(
//       ${CurrencyFields.id} $idType,
//       ${CurrencyFields.success} $boolType,
//       ${CurrencyFields.timestamp} $intType,
//       ${CurrencyFields.base} $textType,
//       ${CurrencyFields.date} $textType,
//     )
//     ''');
//   }

//   Future<LocalCurrency> create(LocalCurrency currency) async {
//     final db = await instance.database;

//     // final id = await db.insert(tableCurrencies, currency.toJson());
//   }

//   Future close() async {
//     final db = await instance.database;

//     db.close();
//   }
// }
