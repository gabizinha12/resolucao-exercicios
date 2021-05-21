"""Programa: exercicio.py

Descrição: Resolução do exercício empresa-programacao em linguagem Python
Autor: Miguel Nischor <miguel@nischor.com.br>
"""

import os

limpar_tela = lambda : os.system("clear") if os.name == "posix" else os.system("cls")
mostrar_titulo = lambda titulo="Controle de Funcionários" : print("=== " + titulo + " ===\n")

class Funcionario:
    """Estrutura de dados para representar o funcionário"""
    def __init__(self, registro, nome, cargo, nivel, \
                 valor_hora, tempo, debitos):
        self.registro = registro
        self.dados = {
            "nome": nome,
            "cargo": cargo,
            "nivel": nivel,
            "valor": valor_hora,
            "tempo": tempo,
            "debitos": debitos,
        }
    
    def calcular_salario(self):
        """Calcula o salário final do funcionário"""
        return self.dados['valor'] * self.dados['tempo'] - self.dados['debitos']

class Imperio:
    """Estrutura de dados para representar o imperio"""
    def __init__(self):
        self.numero_de_funcionarios = 0
        self.funcionarios = []
    
    def cadastro(self):
        quant_funcionarios = input("Quantos funcionários você deseja cadastrar?: ")

        try:
            quant_funcionarios = int(quant_funcionarios)
        except Exception:
            return "Quantidade inválida de funcionários!\n\n"

        for i in range(quant_funcionarios):
            try:
                print("\n ~~~~~~~~~~~ X ~~~~~~~~~~~ X ~~~~~~~~~~~ \n")
                print("Funcionário:", self.numero_de_funcionarios)
                nome = input("Nome do funcionario: ")
                cargo = input("Cargo do funcionário: ")
                nivel = int(input("Nível salarial: "))
                valor_hora = float(input("Salário por hora: "))
                tempo = float(input("Tempo de trabalho no mês (horas): "))
                debitos = float(input("Débitos com a cantina imperial: "))
            except Exception:
                return "Valor inválido! Por favor insira um valor apropriado.\n\n"

            funcionario = Funcionario(self.numero_de_funcionarios, \
                                      nome, cargo, nivel, valor_hora, \
                                      tempo, debitos)
            self.funcionarios.append(funcionario)
            self.numero_de_funcionarios += 1

        return str(quant_funcionarios) + " funcionário(s) inserido(s) com sucesso!\n\n"

    def relatorio_geral(self):
        if(self.numero_de_funcionarios == 0):
            print("Nenhum funcionário cadastrado!\n")

        else:
            for funcionario in self.funcionarios:
                print("Funcionário:", funcionario.registro)
                print("Nome completo:", funcionario.dados['nome'])
                print("Cargo:", funcionario.dados['cargo'])
                print("Nível salarial:", funcionario.dados['nivel'])
                print("Salário:", funcionario.calcular_salario())
                print("\n ~~~~~~~~~~~ X ~~~~~~~~~~~ X ~~~~~~~~~~~ \n")

        input("Pressione enter para voltar...")

    def relatorio_nivel_salarial(self):
        pass

    def custo_mensal(self):
        custo_total = 0.0

        for funcionario in self.funcionarios:
            custo_total += funcionario.calcular_salario()

        print("O custo mensal do império é de: R$", custo_total)
        input("\nPressione enter para voltar...")

def menu():
    mensagem = ""
    imperio = Imperio()

    while(True):
        limpar_tela()
        mostrar_titulo()
        print(mensagem, end="")

        print("0. Sair")
        print("1. Cadastro")
        print("2. Relatório Geral")
        print("3. Relatório por nível salarial")
        print("4. Custo mensal dos funcionários para o império\n")

        print("Sua opção: ", end="")
        opcao = input()
        limpar_tela()

        if(opcao == "0"):
            break

        elif(opcao == "1"):
            mostrar_titulo("Cadastro")
            mensagem = imperio.cadastro()

        elif(opcao == "2"):
            mostrar_titulo("Relatório Geral")
            imperio.relatorio_geral()
            mensagem = ""

        elif(opcao == "3"):
            mensagem = "Ainda não implementado!\n\n"

        elif(opcao == "4"):
            mostrar_titulo("Custo Mensal")
            imperio.custo_mensal()
            mensagem = ""

        else:
            mensagem = "Opção inválida! Por favor insira uma opção de 0 a 4.\n\n"
            continue

if __name__ == '__main__':
    menu()
