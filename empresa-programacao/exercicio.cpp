/*
	Programa: exercicio.cpp
	Descrição: Resolução do exercício empresa-programacao em linguagem C++

	Autor: Miguel Nischor <miguel@nischor.com.br>
*/
#include <iostream>
#include <algorithm>
#include <list>
#include <windows.h>
#include <locale.h>

using namespace std;

// Enumeração para os níveis salariais
enum nivel_salarial
{
	NIVEL_1 = 1,
	NIVEL_2 = 2,
	NIVEL_3 = 3
};

// Estrutura de dados para representar o funcionário
class Funcionario
{
	public:
		char Nome[255];
		unsigned int Registro;
		char Cargo[255];
		nivel_salarial Nivel;
		float Hora;
		unsigned int Tempo;
		unsigned int Debitos;
};

int main(int argc, char** argv)
{
	setlocale(LC_ALL, "pt_BR");

	bool menu = true;
	unsigned int opcao = 0;
	unsigned int quant_funcionarios = 0;
	list<Funcionario> empresa;

	// Loop do menu do programa, limitado pela variável menu
	do
	{
		cout << "=== Controle de Funcionários ===" << endl << endl;
		cout << "0. Sair" << endl;
		cout << "1. Cadastro" << endl;
		cout << "2. Relatório Geral" << endl;
		cout << "3. Relatório por nível salarial" << endl;
		cout << "4. Custo mensal dos funcionários para o império" << endl << endl;

		cout << "Sua opção: ";
		cin >> opcao;
		cout << endl << endl;

		switch (opcao)
		{
			// Opção 0: Sair - Limpa o texto da tela e sai do programa
			case 0:
			{
				system("pause");
				menu = false;
				break;
			};

			// Opção 1: Cadastro - Efetua um novo cadastro no sistema
			case 1:
			{
				// Limpeza da tela
				system("cls");

				cout << "Quantos funcionários você deseja cadastrar? ";
				cin >> quant_funcionarios;
				cout << endl << endl;

				// Criação das novas instâncias de dados para o cadastro da empresa
				empresa.resize(quant_funcionarios);

				// Iterador de dados para a estrutura de funcion�rios
				list<Funcionario>::iterator it;

				for (it = empresa.begin(); it != empresa.end(); ++it)
				{
					cout << "Nome do funcionario: ";
					cin >> it->Nome;
					cout << endl;

					cout << "Cargo do funcionário: ";
					cin >> it->Cargo;
					cout << endl;

					// cout << "Nível salarial: ";
					// cin >> it->Nivel;
					// cout << endl;

					cout << "Salário por hora: ";
					cin >> it->Hora;
					cout << endl;

					cout << "Horas de trabalho no mês: ";
					cin >> it->Tempo;
					cout << endl;

					cout << "Débitos com a cantina: ";
					cin >> it->Debitos;
					cout << endl << endl;

					// A cada novo registro, vamos incrementar o contador de registros
					it->Registro++;
				};

				// Limpa a tela após o cadastro de todos
				system("cls");
			};

			// Opção 2: Relatório Geral - Mostra o cadastro de todos os funcion�rios no sistema
			case 2:
			{
				system("cls");

				list<Funcionario>::iterator it;

				cout << "=== Relatório Geral ===" << endl << endl;

				for (it = empresa.begin(); it != empresa.end(); ++it)
				{
					cout << "Funcionário " << it->Registro << ":" << endl << endl;
					cout << "Nome completo: " << it->Nome << endl;
					cout << "Cargo: " << it->Cargo << endl;
					cout << "Valor da hora: " << it->Hora << endl;
					cout << "Carga horária mensal: " << it->Tempo << endl;
					cout << "Débitos com a cantina: " << it->Debitos << endl << endl;
				};

				system("pause");
				system("cls");
			};

			// Opção 3: Relatório por nível salarial - Relatório separado pelo membro it->Nivel
			case 3:
			{
				// A implementar
				break;
			};

			// Opção 4: Custo mensal - Relat�rio de custos mensais
			case 4:
			{
				system("cls");

				cout << "=== Relatório de custos mensais ===" << endl << endl;

				// Precisamos do iterador para navegar entre os registros
				list<Funcionario>::iterator it;
				
				// Variáveis para cálculos
				float salario_total = 0.0f;

				for (it = empresa.begin(); it != empresa.end(); ++it)
					salario_total += it->Hora * it->Tempo;

				cout << "Custo total: R$ " << salario_total << endl << endl;

				system("pause");
				system("cls");
			};
		};
	} while (menu);

	system("pause");
	return 0;
};