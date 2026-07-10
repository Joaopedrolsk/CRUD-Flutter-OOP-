import 'contato.dart';

class ContatoEmpresarial extends Contato {
  String empresa;

  ContatoEmpresarial(super.nome, super.telefone, super.email, this.empresa);

  @override
  imprimirDetalhe() {
    print('Apelido: $empresa');
    super.imprimirDetalhe();
  }
}
