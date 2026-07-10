# 📓 CRUD - Agenda de Contatos

Um aplicativo de agenda de contatos desenvolvido em **Dart** com princípios de **Programação Orientada a Objetos (OOP)**, implementando operações completas de CRUD (Create, Read, Update, Delete).

## 🎯 Visão Geral

Este projeto demonstra a aplicação prática de conceitos fundamentais de OOP em Dart, incluindo:
- **Herança**: Classe abstrata `Contato` com subclasses especializadas
- **Encapsulamento**: Organização clara de responsabilidades
- **Polimorfismo**: Diferentes tipos de contatos com comportamentos específicos
- **Persistência de Dados**: Salvamento e carregamento de contatos em arquivo

## ✨ Funcionalidades

### Operações CRUD
- ✅ **Adicionar Contatos**: Criação de novos contatos (Pessoal ou Empresarial)
- ✅ **Listar Contatos**: Visualização de todos os contatos cadastrados
- ✅ **Editar Contatos**: Atualização de informações existentes
- ✅ **Remover Contatos**: Exclusão segura com confirmação
- ✅ **Buscar Contatos**: Pesquisa por nome (suporta busca parcial)

### Recursos Adicionais
- 📊 **Estatísticas**: Visualizar dados agregados (total de contatos, com e-mail, nome mais longo)
- 📜 **Histórico**: Registro de todas as operações realizadas
- 📄 **Persistência**: Salvamento automático e carregamento de contatos
- 📋 **Detalhes do Contato**: Visualização completa das informações de um contato específico

## 📦 Estrutura do Projeto

```
CRUD-Flutter-OOP-/
├── main.dart                    # Ponto de entrada - Menu principal
├── agenda.dart                  # Classe principal com lógica CRUD
├── contato.dart                 # Classe abstrata base para contatos
├── contato_pessoal.dart         # Subclasse para contatos pessoais
├── contato_empresarial.dart     # Subclasse para contatos empresariais
├── agenda.txt                   # Arquivo de persistência de dados
└── .vscode/                     # Configurações do VS Code
```

## 🏗️ Arquitetura e Design

### Hierarquia de Classes

```
Contato (Abstrata)
├── ContatoPessoal
│   └── apelido: String
└── ContatoEmpresarial
    └── empresa: String
```

### Classe Principal: `Agenda`

Responsável por toda a lógica CRUD e gerenciamento:
- **Métodos de Validação**: `indiceValido()`, `existe()`
- **Métodos de Entrada**: `lerNome()`, `lerTelefone()`, `lerEmail()`
- **Operações CRUD**: `adicionar()`, `listar()`, `editar()`, `remover()`
- **Recursos**: `buscar()`, `estatisticas()`, `mostrarHistorico()`
- **Persistência**: `salvar()`, `carregar()`

## 🚀 Como Usar

### Pré-requisitos
- Dart SDK instalado (versão 2.12 ou superior)

### Instalação e Execução

1. Clone o repositório:
```bash
git clone https://github.com/Joaopedrolsk/CRUD-Flutter-OOP-.git
cd CRUD-Flutter-OOP-
```

2. Execute o programa:
```bash
dart main.dart
```

### Fluxo de Uso

O programa apresenta um menu interativo:

```
=====================
       📓 AGENDA 📓
=====================
1 - Adicionar
2 - Listar
3 - Editar
4 - Remover
5 - Buscar
6 - Histórico
7 - Estatísticas
8 - SAIR
9 - Imprimir Detalhe
=====================
```

Escolha a opção desejada digitando o número correspondente.

## 📋 Validações Implementadas

### Nome
- ✓ Não pode ser vazio
- ✓ Não pode conter ponto e vírgula (`;`)
- ✓ Não permite duplicação de nomes

### Telefone
- ✓ Validação com regex: `(00)00000-0000`
- ✓ Formato brasileiro padrão

### E-mail
- ✓ Validação completa com regex
- ✓ Verifica formato padrão de e-mail

## 💾 Formato de Persistência

Os contatos são salvos no arquivo `agenda.txt` em formato delimitado por ponto e vírgula:

```
P;João Silva;(11)99999-9999;joao@email.com;Joãozinho
E;Empresa ABC;(11)88888-8888;contato@empresa.com;ABC Ltda
```

**Prefixos**:
- `P`: Contato Pessoal
- `E`: Contato Empresarial

## 📚 Conceitos OOP Aplicados

| Conceito | Implementação |
|----------|---------------|
| **Abstração** | Classe abstrata `Contato` define interface comum |
| **Herança** | `ContatoPessoal` e `ContatoEmpresarial` herdam de `Contato` |
| **Polimorfismo** | Método `imprimirDetalhe()` implementado diferentemente em subclasses |
| **Encapsulamento** | Validações encapsuladas na classe `Agenda` |

## 🔍 Exemplos de Uso

### Adicionar um Contato Pessoal
```
Opção: 1
Nome: João Silva
Telefone: (11)99999-9999
E-mail: joao@example.com
Tipo: 2 (Pessoal)
Apelido: Joãozinho
✓ Contato adicionado.
```

### Buscar um Contato
```
Opção: 5
Buscar nome: João
0 - João Silva | (11)99999-9999 | joao@example.com
```

### Visualizar Estatísticas
```
Opção: 7
Total de contatos: 5
Com e-mail preenchido: 5
Nome mais longo: Maria de Oliveira Silva
```

## 🛠️ Melhorias Futuras

- [ ] Implementar persistência em banco de dados (SQLite/Firebase)
- [ ] Criar interface gráfica com Flutter
- [ ] Adicionar categorias de contatos
- [ ] Implementar busca avançada com múltiplos filtros
- [ ] Adicionar importação/exportação de dados (CSV, JSON)
- [ ] Implementar autenticação de usuário
- [ ] Adicionar backup automático
- [ ] Suporte a múltiplas fotos por contato

## 📄 Licença

Este projeto é de código aberto e está disponível sob a licença MIT.

## 👨‍💻 Autor

**João Pedro** - [GitHub](https://github.com/Joaopedrolsk)

---

**Desenvolvido com ❤️ em Dart**
