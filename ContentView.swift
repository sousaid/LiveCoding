//
//  ContentView.swift
//  liveCoding
//
//  Created by SOUSAID on 28/8/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var calculatorViewModel = CalculatorViewModel()

    let buttons: [[String]] = [
        ["1", "2", "3", "/"],
        ["4", "5", "6", "*"],
        ["7", "8", "9", "+"],
        ["0", ".", "%", "-"],
        ["AC", "<==", "="]
    ]

    var body: some View {
        VStack(spacing: 15) {
            Text(calculatorViewModel.operation.currentNumber)
                .font(.title)
                .frame(maxWidth: .infinity, maxHeight: 50, alignment: .trailing)
                .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 2)
                    )

            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 15) {
                    ForEach(row, id: \.self) { item in
                        ButtonView(calculatorViewModel: calculatorViewModel, name: item)
                    }
                }
            }
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
