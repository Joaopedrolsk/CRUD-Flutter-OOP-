import 'contato.dart';

class ContatoPessoal extends Contato {
  String apelido;

  ContatoPessoal(String nome, String Telefone, String email, this.apelido)
    : super(nome, Telefone, email);

  @override
  imprimirDetalhe() {
    print('Apelido: $apelido');
    super.imprimirDetalhe();
  }
}
