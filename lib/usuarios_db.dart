import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as arquivos;

class DatabaseHelper {
  static const _arquivoBancoDeDados = 'UsuariosBDados.db';
  static const _bancoVersao = 1;

  static const tabelaUsuarios = 'Users';
  static const usuarioIdColuna = '_id';
  static const usuarioUsername = 'Username';
  static const usuarioPrimeiroNome = 'FirstName';
  static const usuarioSegundoNome = 'LastName';
  static const usuarioIdade = 'Age';
  static const usuarioProfissao = 'Occupation';
  static const usuarioEmail = 'Email';
  static const usuarioSenha = 'Password';

  static const tabelaLogin = 'Login';
  static const usuarioAuten = 'SessionId';

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
    _usuariosDB = await _carregarBanco();
    return _usuariosDB!;
  }

  // Abre ou cria um banco de dados válido caso ainda não exista
  _carregarBanco() async {
    String caminhoDoDB = await getDatabasesPath();
    caminhoDoDB = arquivos.join(caminhoDoDB, _arquivoBancoDeDados);
    return await openDatabase(caminhoDoDB,
        version: _bancoVersao, onCreate: _onCreate);
  }

  // Código SQL para criar o banco de dados com todas as colunas e tabelas necessárias
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tabelaUsuarios (
        $usuarioIdColuna INTEGER PRIMARY KEY,
        $usuarioUsername TEXT NOT NULL,
        $usuarioPrimeiroNome TEXT NOT NULL,
        $usuarioSegundoNome TEXT NOT NULL,
        $usuarioIdade INTEGER NOT NULL,
        $usuarioProfissao TEXT NOT NULL,
        $usuarioEmail TEXT NOT NULL,
        $usuarioSenha TEXT NOT NULL
      )
      ''');
  }
}
