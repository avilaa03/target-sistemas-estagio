import Foundation

func sequenciaFibonacci(forNumber numero: Int) -> Bool {
    var primeiro = 0
    var segundo = 1
    var atual = 0
    
    while atual < numero {
        atual = primeiro + segundo
        primeiro = segundo
        segundo = atual
    }
    
    if atual == numero {
        return true
    } else {
        return false
    }
}

let numeroParaTestar = 21

if sequenciaFibonacci(forNumber: numeroParaTestar) {
    print("\(numeroParaTestar) pertence à sequência de Fibonacci")
} else {
    print("\(numeroParaTestar) não pertence à sequência de Fibonacci")
}
