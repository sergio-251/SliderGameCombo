//
//  GameSlider.swift
//  SliderGameCombo
//
//  Created by Sergey Efimov on 11.01.2022.
//

import SwiftUI

struct GameSlider: View {
    @Binding var currentValue: Double
    
    let opacity: Int
    let gameValue: Int
    let color: UIColor
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(gameValue)")
            HStack {
                Text("0")
                SliderView(value: $currentValue, opacity: opacity, color: color)
                Text("100")
            }
            .padding()
        }
    }
}

struct GameSlider_Previews: PreviewProvider {
    static var previews: some View {
        GameSlider(
            currentValue: .constant(50),
            opacity: 60, gameValue: 0,
            color: .red
        )
    }
}
