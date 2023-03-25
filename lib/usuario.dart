enum GeneroUsuario {
  mulher, homem, outros
}

enum SoftSkills {
  comunicacao, lidar, trabalhoEquipe, resolvedor, gerente, adaptabilidade, criatividade, resolConflitos, habiOrganiza, 
}

// Define o que é um usuário em nosso sistema
class TrampoUsuario {
  String username = '', primeiroNome = '', ultimoNome = '', ocupacaoProfissional = '', email = '', senha = '';
  int idadeAtual = 0;

  static final Map<SoftSkills, String> habilidades = {
    SoftSkills.comunicacao: 'Comunicação',
    SoftSkills.lidar: 'Liderança',
    SoftSkills.trabalhoEquipe: 'Trabalho em Equipe',
    SoftSkills.resolvedor: 'Resolvedor de Problemas',
    SoftSkills.gerente: 'Gerente de Equipes',
    SoftSkills.adaptabilidade: 'Adaptabilidade',
    SoftSkills.criatividade: 'Criatividade',
    SoftSkills.resolConflitos: 'Resolvedor de Conflitos',
    SoftSkills.habiOrganiza: 'Habilidades Organizacionais'
  };

  static final List<String> ocupacoesProfissionais = [
    'Técnico de Informática', 
    'Professor', 
    'Doutor', 
    'Pedreiro', 
    'Flanelinha', 
    'Faxineiro', 
    'Jardineiro', 
    'Outro (Não especificado)'
  ];

  // Método especializado para criar um membro do tipo `Usuário`
  static TrampoUsuario criarUsuario() {
    return TrampoUsuario();
  }  
}
