// ignore: unused_import
import 'usuario.dart';

// Integra justo ao banco de dados todos os usuários do sistema
class Clientes {
  List usuarios = [];

  // Só deve haver uma única instância de `Clientes` por sessão!
  static Clientes instance = Clientes();

  late Clientes sessaoLogado;

  // Método para cadastrar um usuário na plataforma
  bool cadastrarUsuario(String usuarioInfo) {
    return true;
  }

}
