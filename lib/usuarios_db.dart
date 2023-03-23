import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as arquivos;

class DatabaseHelper {
  static const _databaseName = 'usuarios_banco.db';
  static const _databaseVersion = 1;

  static const table = 'user';
  static const columnId = '_id';
  static const columnUsername = 'username';
  static const columnFirstName = 'first_name';
  static const columnLastName = 'last_name';
  static const columnAge = 'age';
  static const columnOccupation = 'occupation';
  static const columnEmail = 'email';
  static const columnPassword = 'password';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _usuariosDB;

  // Abrindo nosso banco de dados em uma nova thread, a performance não será impactada
  // mesmo se o banco tiver mais de 100 megabytes de tamanho!
  Future<Database> get bancoUsuarios async {
    if (_usuariosDB != null) {
      return _usuariosDB!;
    }
    _usuariosDB = await _initDatabase();
    return _usuariosDB!;
  }

  // open the database or create it if it doesn't exist
  _initDatabase() async {
    String path = await getDatabasesPath();
    path = arquivos.join(path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnUsername TEXT NOT NULL,
        $columnFirstName TEXT NOT NULL,
        $columnLastName TEXT NOT NULL,
        $columnAge INTEGER NOT NULL,
        $columnOccupation TEXT NOT NULL,
        $columnEmail TEXT NOT NULL,
        $columnPassword TEXT NOT NULL
      )
      ''');
  }

  // Insere uma nova linha no nosso banco de dados
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.bancoUsuarios;
    return await db.insert(table, row);
  }
}
