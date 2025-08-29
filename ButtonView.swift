//
//  ButtonView.swift
//  liveCoding
//
//  Created by SOUSAID on 28/8/2025.
//
import SwiftUI

struct ButtonView: View {
    @ObservedObject var calculatorViewModel: CalculatorViewModel
    var name: String

    var body: some View {
        Button(name) {
            calculatorViewModel.pressButton(name)
        }
        .frame(width: 50, height: 50)
        .foregroundColor(.black)
        .background(Color.yellow)
        .clipShape(Circle())
    }
}

#Preview {
    //ButtonView(calculatorViewModel: ¥>, name: .constant("2"))
}
