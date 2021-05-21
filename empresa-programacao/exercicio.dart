// Programa: exercicio.dart
// Descrição: Resolução do exercício empresa-programacao em linguagem Dart
// Autor: Sergio Souza Novak <serginhosnovak@hotmail.com>

import 'dart:async';
import 'dart:io';

enum nivelSalarial { NIVEL_1, NIVEL_2, NIVEL_3 }

class Funcionario {
  late String Nome;
  late int Registro;
  late String Cargo;
  late int Nivel;
  late double hora;
  late int Tempo;
  late int Debitos;

  @override
  String toString() {
    return '''
        Nome = ${this.Nome}
         Registro = ${this.Registro}
         Cargo = ${this.Cargo}
         Nivel = ${this.Nivel}
         hora = ${this.hora}
         Tempo = ${this.Tempo}
         Debitos = ${this.Debitos}
    
    ''';
  }

  darEntrada() {
    this.Nome = stdin.readLineSync() as String;
    this.Registro = int.parse(stdin.readLineSync()!);
    this.Cargo = stdin.readLineSync() as String;
    this.Nivel = int.parse(stdin.readLineSync()!);
    this.hora = double.parse(stdin.readLineSync()!);
    this.Tempo = int.parse(stdin.readLineSync()!);
    this.Debitos = int.parse(stdin.readLineSync()!);
  }
}

List<Funcionario> empresa = [];

class UI {
  static clear() {
    for (int i = 0; i < stdout.terminalLines; i++) {
      stdout.writeln();
    }
  }

  static void RealizarAcao(int op) {
    clear();
    switch (op) {
      // Opção 1: Cadastro - Efetua um novo cadastro no sistema
      case 1:
        Funcionario f = new Funcionario();
        f.darEntrada();
        print(f);
        empresa.add(f);
        break;
      case 2:
        empresa.forEach((element) {
          print(element);
        });

        break;
      case 3:
        // ainda não implementado
        break;

      // Opção 4: Custo mensal - Relat�rio de custos mensais
      case 4:
        double soma = 0.0;
        empresa.forEach((element) {
          soma += element.hora * element.Tempo;
        });
        print("=== Relatório de custos mensais ===");
        double salarioTotal = 0.0;
        print("""
        Custo total: R\$ ${soma}
      """);
        break;

      case 0:
        exit(0);
    }
  }

  static String? lerOpcaoMenu() {
    return stdin.readLineSync();
  }

  static Future<void> mostrarMenu() async {
    while (true) {
      print("=== Controle de Funcionários ===");
      print("0. Sair");
      print("1. Cadastro");
      print("2. Relatório Geral");
      print("3. Relatório por nível salarial");
      print("4. Custo mensal dos funcionários para o império");
      var op = lerOpcaoMenu();

      RealizarAcao(int.parse(op == null ? "" : op));
    }
  }
}

main(List<String> args) {
  UI.mostrarMenu();
}
