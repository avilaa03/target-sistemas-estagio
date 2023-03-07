import UIKit

struct Dados: Codable {
    var dia: Int
    var valor: Double
}

let fileURL = Bundle.main.url(forResource: "dados", withExtension: "json")!
let jsonData = try! Data(contentsOf: fileURL)
let faturamentos = try! JSONDecoder().decode([Dados].self, from: jsonData)

struct Faturamento {
    let menor: Double
    let maior: Double
    let acimaDaMedia: Int
    let maiorDia: Int
    let menorDia: Int
}

func calcularFaturamento() {
    
    // Calcular o menor e o maior valor de faturamento
        var menor = Double.greatestFiniteMagnitude
        var menorDia = 0
        var maior = 0.0
        var maiorDia = 0
        var soma = 0.0
        var qtdDiasComFaturamento = 0
        
        for faturamento in faturamentos {
            if faturamento.valor > 0.0 {
                soma += faturamento.valor
                qtdDiasComFaturamento += 1
            }
            if faturamento.valor < menor && faturamento.valor != 0.0 {
                menor = faturamento.valor
                menorDia = faturamento.dia
            }
            if faturamento.valor > maior {
                maior = faturamento.valor
                maiorDia = faturamento.dia
            }
        }
        
        let media = qtdDiasComFaturamento > 0 ? soma / Double(qtdDiasComFaturamento) : 0.0
        
        // Calcular o número de dias em que o faturamento foi superior à média
        var acimaDaMedia = 0
        
        for faturamento in faturamentos {
            if faturamento.valor > media {
                acimaDaMedia += 1
            }
        }
        
        let faturamentoViewModel = Faturamento(menor: menor, maior: maior, acimaDaMedia: acimaDaMedia, maiorDia: maiorDia, menorDia: menorDia)
    
        print("O dia com maior faturamento foi \(maiorDia), o faturamento foi de R$\(maior)")
        print("O dia com menor faturamento foi \(menorDia), o faturamento foi de R$\(menor)")
        print("Tiveram \(acimaDaMedia) dias acima da média de faturamento.")
}

calcularFaturamento()
