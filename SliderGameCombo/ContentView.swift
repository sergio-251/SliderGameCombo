//
//  ContentView.swift
//  SliderGameCombo
//
//  Created by Sergey Efimov on 11.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var gameValue = Int.random(in: 1...100)
    @State private var currentValue = 50.0
    @State private var showAlert = false
        
    var body: some View {
        VStack {
           GameSlider(
            currentValue: $currentValue,
            opacity: scoreCalculate(), gameValue: gameValue,
            color: .red
           )
            
            ButtonView(
                showAlert: $showAlert,
                title: "Проверь меня!",
                currentScore: scoreCalculate(),
                action: { showAlert = true }
            )
            
            ButtonView(title: "Начать заново") {
                gameValue = Int.random(in: 1...100)
            }
        }
    }
    
    private func scoreCalculate() -> Int {
        let difference = abs(gameValue - lround(currentValue))
        return 100 - difference
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
