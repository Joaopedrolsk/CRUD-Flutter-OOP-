import 'dart:io';

import 'contato.dart';
import 'contato_empresarial.dart';
import 'contato_pessoal.dart';

class Agenda {
  List<String> historico = [];
  List<Contato> contatos = [];

  bool indiceValido(int i) {
    return i >= 0 && i < contatos.length;
  }

  String lerNome() {
    while (true) {
      stdout.write('Nome: ');
      String nome = stdin.readLineSync() ?? '';

      if (nome.trim().isNotEmpty && !nome.contains(';')) {
        return nome.trim();
      }

      print('Não pode ficar vazio e nem conter ponto e vírgula.');
    }
  }

  String lerTelefone() {
    while (true) {
      stdout.write('Telefone padrão: (00)00000-0000 ');
      String telefone = stdin.readLineSync() ?? '';

      if (RegExp(r'^\(\d{2}\)\s?\d{4,5}-\d{4}$').hasMatch(telefone)) {
        return telefone;
      }

      print('Telefone inválido. Use o padrão: (00)00000-0000.');
    }
  }

  String lerEmail() {
    while (true) {
      stdout.write('E-mail: ');
      String email = stdin.readLineSync() ?? '';

      if (RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      ).hasMatch(email)) {
        return email;
      }

      print('E-mail inválido.');
    }
  }

  bool existe(String nome) {
    for (var contato in contatos) {
      if (contato.nome.toLowerCase() == nome.toLowerCase()) {
        return true;
      }
    }

    return false;
  }

  void adicionar() {
    String nome = lerNome();

    if (existe(nome)) {
      print('Já existe um contato com esse nome.');
      return;
    }

    String telefone = lerTelefone();
    String email = lerEmail();

    print('''
Selecione qual tipo de contato:

1 - Contato Empresarial
2 - Contato Pessoal
''');

    String tipo = stdin.readLineSync() ?? '';

    if (tipo == '1') {
      stdout.write('Empresa: ');
      String empresa = stdin.readLineSync() ?? '';

      contatos.add(ContatoEmpresarial(nome, telefone, email, empresa));
    } else if (tipo == '2') {
      stdout.write('Digite seu apelido: ');
      String apelido = stdin.readLineSync() ?? '';

      contatos.add(ContatoPessoal(nome, telefone, email, apelido));
    } else {
      print('Tipo de contato inválido.');
      return;
    }

    historico.add('Adicionou $nome');

    print('✓ Contato adicionado.');
  }

  void listar() {
    if (contatos.isEmpty) {
      print('Agenda vazia.');
      return;
    }

    for (int i = 0; i < contatos.length; i++) {
      print(
        '$i - ${contatos[i].nome} | '
        '${contatos[i].telefone} | '
        '${contatos[i].email}',
      );
    }
  }

  void editar() {
    listar();

    if (contatos.isEmpty) {
      return;
    }

    stdout.write('Índice para editar: ');
    int i = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    if (!indiceValido(i)) {
      print('Índice inválido.');
      return;
    }

    String nomeAntigo = contatos[i].nome;

    stdout.write('Novo nome: ');
    String novoNome = stdin.readLineSync() ?? '';

    if (novoNome.trim().isEmpty || novoNome.contains(';')) {
      print('Nome inválido.');
      return;
    }

    if (novoNome.toLowerCase() != nomeAntigo.toLowerCase() &&
        existe(novoNome)) {
      print('Já existe um contato com esse nome.');
      return;
    }

    String novoTelefone = lerTelefone();
    String novoEmail = lerEmail();

    contatos[i].nome = novoNome.trim();
    contatos[i].telefone = novoTelefone;
    contatos[i].email = novoEmail;

    historico.add('Editou $nomeAntigo');

    print('✓ Contato atualizado.');
  }

  void remover() {
    listar();

    if (contatos.isEmpty) {
      return;
    }

    stdout.write('Índice para remover: ');
    int i = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    if (!indiceValido(i)) {
      print('Índice inválido.');
      return;
    }

    stdout.write('Remover ${contatos[i].nome}? (s/n): ');

    String resposta = (stdin.readLineSync() ?? '').toLowerCase();

    if (resposta == 's') {
      String removido = contatos[i].nome;

      contatos.removeAt(i);

      historico.add('Removeu $removido');

      print('✓ Contato removido.');
    } else {
      print('Remoção cancelada.');
    }
  }

  void buscar() {
    stdout.write('Buscar nome: ');
    String termo = (stdin.readLineSync() ?? '').toLowerCase();

    bool achou = false;

    for (int i = 0; i < contatos.length; i++) {
      if (contatos[i].nome.toLowerCase().contains(termo)) {
        print(
          '$i - ${contatos[i].nome} | '
          '${contatos[i].telefone} | '
          '${contatos[i].email}',
        );

        achou = true;
      }
    }

    if (!achou) {
      print('Nenhum contato encontrado.');
    }
  }

  void estatisticas() {
    int comEmail = 0;
    String maisLongo = '';

    for (var contato in contatos) {
      if (contato.email.isNotEmpty) {
        comEmail++;
      }

      if (contato.nome.length > maisLongo.length) {
        maisLongo = contato.nome;
      }
    }

    print('Total de contatos: ${contatos.length}');
    print('Com e-mail preenchido: $comEmail');

    if (maisLongo.isEmpty) {
      print('Nome mais longo: nenhum');
    } else {
      print('Nome mais longo: $maisLongo');
    }
  }

  void mostrarHistorico() {
    if (historico.isEmpty) {
      print('Histórico vazio.');
      return;
    }

    for (String item in historico) {
      print('• $item');
    }
  }

  void salvar() {
    List<String> linhas = [];

    for (var contato in contatos) {
      if (contato is ContatoPessoal) {
        linhas.add(
          'P;${contato.nome};${contato.telefone};'
          '${contato.email};${contato.apelido}',
        );
      } else if (contato is ContatoEmpresarial) {
        linhas.add(
          'E;${contato.nome};${contato.telefone};'
          '${contato.email};${contato.empresa}',
        );
      }
    }

    File('agenda.txt').writeAsStringSync(linhas.join('\n'));

    print('✓ Agenda salva.');
  }

  void carregar() {
    File arquivo = File('agenda.txt');

    if (!arquivo.existsSync()) {
      return;
    }

    contatos.clear();

    List<String> linhas = arquivo.readAsLinesSync();

    for (String linha in linhas) {
      if (linha.trim().isEmpty) {
        continue;
      }

      List<String> partes = linha.split(';');

      if (partes.length < 5) {
        print('Linha inválida ignorada: $linha');

        continue;
      }

      if (partes[0] == 'P') {
        contatos.add(
          ContatoPessoal(partes[1], partes[2], partes[3], partes[4]),
        );
      } else if (partes[0] == 'E') {
        contatos.add(
          ContatoEmpresarial(partes[1], partes[2], partes[3], partes[4]),
        );
      }
    }

    print('✓ Agenda carregada.');
  }

 void imprimirDetalhe() {
  listar();

  if (contatos.isEmpty) {
    return;
  }

  stdout.write('Índice do contato para ver detalhes: ');
  int i = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

  if (!indiceValido(i)) {
    print('Índice inválido.');
    return;
  }

  contatos[i].imprimirDetalhe();
}
}
