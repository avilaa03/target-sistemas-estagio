import UIKit

let estados:[String:Double] = ["SP": 67836.43, "RJ": 36678.66, "MG": 29229.88, "ES": 27165.48, "Outros": 19849.53]
var somaFaturamento: Double = 0.0

estados.values.forEach { estado in
    somaFaturamento += estado
}

print("Soma completa de todos os faturamentos de todos os Estados: \(somaFaturamento)")

for (estado, valor) in estados {
    let porcentagem = round((valor / somaFaturamento) * 100 * 100) / 100
    print("\(estado): \(porcentagem)%")
}
