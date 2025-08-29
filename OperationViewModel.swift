//
//  operationViewModel.swift
//  liveCoding
//
//  Created by SOUSAID on 28/8/2025.
//

import SwiftUI
import Combine

class CalculatorViewModel: ObservableObject {
    @Published var operation = OperationObject()

    func pressButton(_ value: String) {
        switch value {
        case "+", "-", "*", "/", "%":
            operation.firstNumber = Double(operation.currentNumber) ?? 0
            operation.operation = value
            operation.currentNumber = ""
            
        case "=":
            operation.secondNumber = Double(operation.currentNumber) ?? 0
            calcul()
            operation.currentNumber = String(operation.result)
            
        case ".":
               if !operation.currentNumber.contains(".") {
                   operation.currentNumber += "."
               }
            
        case "<==":
                if !operation.currentNumber.isEmpty {
                    operation.currentNumber.removeLast()
                }
            
        case "AC":
            operation.currentNumber = ""
            operation.secondNumber = 0
            operation.firstNumber = 0
            operation.result = 0
            
        default:
            operation.currentNumber += value
        }
    }

    private func calcul() {
        switch operation.operation {
        case "+": operation.result = operation.firstNumber + operation.secondNumber
        case "-": operation.result = operation.firstNumber - operation.secondNumber
        case "*": operation.result = operation.firstNumber * operation.secondNumber
        case "/": operation.result = operation.secondNumber == 0 ? 0 : operation.firstNumber / operation.secondNumber
        case "%": operation.result = operation.firstNumber.truncatingRemainder(dividingBy: operation.secondNumber)
        default: break
        }
    }
}

