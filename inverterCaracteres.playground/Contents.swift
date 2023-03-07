import UIKit

var palavra: String = "Bolinho de Arroz"
var palavraCortada = Array(palavra)
var reverso = ""
for letra in palavraCortada {
    reverso.insert(letra, at: reverso.startIndex)
}
print(reverso)
