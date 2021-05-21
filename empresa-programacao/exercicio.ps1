

# Programa: exercicio.ps1
# Descrição: Resolução do exercício empresa-programacao em linguagem Powershell
# Autor: Sergio Souza Novak <serginhosnovak@hotmail.com>

class Funcionario{
    [String]$Nome
    [int]$Registro
    [String]$Cargo
    [int]$Nivel
    [double]$hora
    [int]$Tempo
    [int]$Debitos

    [void]darEntrada(){

        $this.Nome = Read-Host "Nome do funcionario: "
        $this.Registro = Read-Host "Registro do funcionario: "
        $this.Cargo = Read-Host "Salario por hora: "
        $this.Nivel = Read-Host "Nivel salarial"
        $this.hora = Read-Host "Horas de trabalho no mes: "
        $this.Tempo = Read-Host "Tempo "
        $this.Debitos = Read-Host "Debitos com a cantina: "
    }
}


class Imperio{
    [Funcionario[]]$empresa
    Imperio(){
        $this.empresa = @();    
    }
    
    [void] RealizarAcao([int]$op){
        Write-Host ($op)
        switch ( $op )
        {
            1 {

                $funcionario = [Funcionario]::new()
                $funcionario.darEntrada()
                $this.empresa += $funcionario
            }   
            2 {
                foreach ($item in $this.empresa) {
                Write-Host ($item | Format-List | Out-String)
                 }
            }  
            3{
                #Ainda não implementado
            } 
            4{
                $soma = 0.0
                foreach ($item in $this.empresa) {
                    $soma += $item.hora * $item.Tempo
                }
                Write-Host "=== Relatório de custos mensais ==="
                Write-Host " Custo total: R$ "+$soma

            }
        }
    }
}

class UI{

    [Imperio]$imperio
    
    [int]AbrirMenu(){

        Write-Host "=== Controle de Funcionarios ==="
        Write-Host "0. Sair" 
        Write-Host "1. Cadastro" 
        Write-Host "2. Relatorio Geral" 
        Write-Host "3. Relatorio por nivel salarial" 
        $op = Read-Host "4. Custo mensal dos funcionarios para o imperio"
        return [int]$op
    }

    UI(){
        $this.imperio = [Imperio]::new()
    }

    [void]start(){
        [int]$op = -1
        do{
           $op =  $this.AbrirMenu()
           $this.imperio.RealizarAcao($op -as [int])
           
        }while(($op -as [int]) -ne 0)
    }

}

$interfaceUI = [UI]::new()
$interfaceUI.start()

