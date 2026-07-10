abstract class Contato {
  String nome;
  String telefone;
  String email;

  Contato(this.nome, this.telefone, this.email);

  void imprimirDetalhe() {
    print('==============');
    print('Dados do contato');
    print('Nome: $nome');
    print('telefone: $telefone');
    print('email: $email');
  }
}
